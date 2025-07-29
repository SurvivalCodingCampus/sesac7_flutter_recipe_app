import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipe_event.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_state.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipes_repository.dart';

import '../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../../saved_recipes/domain/use_case/fetch_recipes_use_case.dart';
import '../domain/use_case/filter_recipes_use_case.dart';
import '../domain/use_case/search_recipes_use_case.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  final FetchRecipesUseCase _fetchRecipesUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;

  SearchRecipesState _state = SearchRecipesState.initial();
  SearchRecipesState get state => _state;

  Timer? _debounceTimer;

  // search_recipes_state 파일에서 initial 초기화
  // 외부에서 캡슐화된 _state를 사용할 수 있게 getter 함수 생성

  final _eventController = StreamController<SearchRecipeEvent>();
  Stream<SearchRecipeEvent> get eventStream => _eventController.stream;

  SearchRecipesViewModel({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required RecipeRepository repository,
    required SearchRecipesUseCase searchRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
  }) : _repository = repository,
       _fetchRecipesUseCase = fetchRecipesUseCase,
       _searchRecipesUseCase = searchRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase;

  // get 말고 fetch 로
  // return 하지말고 notifyListeners

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case SearchRecipes():
        _searchWithText(action.query);
        break;
      case ShowFilterBottomSheet():
        break;
      case ApplyFilter():
        _applyFilter(action.filterSearchState);
        break;
    }
  }

  Future<void> loadRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final result = await _fetchRecipesUseCase.execute();

      result.when(
        success: (fetchedRecipes) {
          _state = state.copyWith(
            originalRecipes: fetchedRecipes.recipes,
            filteredRecipes: fetchedRecipes.recipes,
            resultLabel: '${fetchedRecipes.recipes.length} results',
          );
        },
        failure: (error) {
          // 에러 발생 시 상태에 반영하거나 로깅
          print('Error fetching recipes: $error');
          _state = state.copyWith(resultLabel: 'Failed to fetch recipes');
        },
      );
    } catch (e) {
      print('Unexpected error: $e');
      _state = state.copyWith(resultLabel: 'Unexpected error occurred');
    }

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> _search(String query) async {
    final result = await _searchRecipesUseCase.execute(
      query: query,
      searchRecipesState: state,
    );

    result.when(
      success: (newState) {
        _state = newState;
        if (newState.filteredRecipes.isEmpty) {
          _eventController.add(const SearchRecipeEvent.showEmptyResultSnackBar('검색 결과가 없습니다.'));
        }
      },
      failure: (error) {
        print('Error searching recipes: $error');
        _eventController.add(
          SearchRecipeEvent.showNetworkErrorSnackBar('$error 오류가 발생했습니다.')
        );
      },
    );
    notifyListeners();
  }

  Future<void> _filter(FilterSearchState filterSearchState) async {

    if (!filterSearchState.filterApplied) {
      // 필터가 적용되지 않은 경우, 원본 리스트 유지
      return;
    }

    final result = await _filterRecipesUseCase.execute(
      filterSearchState: filterSearchState,
      currentState: state,
    );

    result.when(
      success: (newState) {
        _state = newState;
      },
      failure: (error) {
        print('Error filtering recipes: $error');
      },
    );

    notifyListeners();
  }

  void _applyFilter(FilterSearchState newFilter) {
    final applied = newFilter.copyWith(filterApplied: true);
    _filter(applied);  // 기존 필터 호출
  }

  void _searchWithText(String query) {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
      print('[DEBUG] Debounce canceled');
    }
    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      print('[DEBUG] Debounce triggered for query: "$query"');
      _search(query);
    });
  }

  void _searchWithFilter() {
    _filter(state.filterSearchState);
  }


  @override
  void dispose() {
    _debounceTimer?.cancel();
    _eventController.close();
    super.dispose();
  }
}
