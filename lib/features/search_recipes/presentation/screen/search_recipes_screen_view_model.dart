import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/use_case/add_search_history_use_case.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/use_case/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/use_case/get_search_histories_use_case.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_action.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_event.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen_state.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../core/debounce.dart';
import '../../data/domain/use_case/search_recipes_use_case.dart';
import 'filter_search_bottom_sheet_state.dart';

class SearchRecipesScreenViewModel with ChangeNotifier {
  final Debounce debounce = Debounce(const Duration(milliseconds: 500));
  final SearchRecipesUseCase _searchRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;
  final GetRecipesUseCase _fetchRecipesUseCase;
  final GetSearchHistoriesUseCase _fetchSearchHistoriesUseCase;
  final AddSearchHistoryUseCase _addSearchHistoryUseCase;
  final _eventController = StreamController<SearchRecipesEvent>();

  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  SearchRecipesScreenState _state = const SearchRecipesScreenState();

  SearchRecipesScreenState get state => _state;

  SearchRecipesScreenViewModel({
    required SearchRecipesUseCase searchRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
    required GetRecipesUseCase fetchRecipesUseCase,
    required GetSearchHistoriesUseCase fetchSearchHistoriesUseCase,
    required AddSearchHistoryUseCase addSearchHistoryUseCase,
  }) : _searchRecipesUseCase = searchRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase,
       _fetchRecipesUseCase = fetchRecipesUseCase,
       _fetchSearchHistoriesUseCase = fetchSearchHistoriesUseCase,
       _addSearchHistoryUseCase = addSearchHistoryUseCase;

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case ChangeQuery():
        debounce.run(() {
          _search(action.query);
        });
      case ShowFilter():
        _eventController.add(SearchRecipesEvent.showFilterBottomSheet());
      case ApplyFilter():
        _filterRecipes(action.state);
    }
  }

  Future<void> fetchRecipes() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final List<Recipe> recipes = await _fetchRecipesUseCase.execute();
    final List<Recipe> searchedHistories = _fetchSearchHistoriesUseCase
        .execute();

    _state = state.copyWith(
      recipes: recipes,
      filteredResult: searchedHistories,
      isLoading: false,
    );
    notifyListeners();
  }

  void _filterRecipes(
    FilterSearchBottomSheetState filterSearchState,
  ) async {
    _state = state.copyWith(
      filterSearchState: filterSearchState,
    );
    notifyListeners();

    // 필터의 대상이 되는 리스트를 쿼리 상태에 따라 결정
    final List<Recipe> baseList = state.query.isEmpty
        ? state.recipes
        : (state.searchedResult ?? state.recipes);

    final filteredList = _filterRecipesUseCase.execute(state, baseList);

    // 필터가 실제로 적용된 경우(즉, 필터가 활성화되어 있고 결과가 있을 때)만 검색 이력에 추가
    final isFilterActive = filterSearchState.selectedRatingFilter != null;
    if (isFilterActive && filteredList.isNotEmpty) {
      _addSearchHistoryUseCase.execute(filteredList);
    }

    _state = state.copyWith(
      filteredResult: (state.query.isNotEmpty || isFilterActive)
          ? filteredList
          : _fetchSearchHistoriesUseCase.execute(),
      searchLabel: (state.query.isNotEmpty || isFilterActive)
          ? 'Search Result'
          : 'Recent Search',
      countingLabel: (state.query.isEmpty && !isFilterActive)
          ? ''
          : '${filteredList.length} recipes',
    );
    notifyListeners();

    if (_state.filteredResult.isEmpty) {
      _eventController.add(SearchRecipesEvent.hasNoResult());
    }
  }

  void _search(String query) {
    try {
      final searchedResult = _searchRecipesUseCase.execute(state, query);

      // 쿼리가 비어있지 않고, 검색 결과가 있으면 이력에 추가
      if (query.isNotEmpty && searchedResult.isNotEmpty) {
        _addSearchHistoryUseCase.execute(searchedResult);
      }

      _state = state.copyWith(
        query: query,
        searchedResult: searchedResult,
      );
      notifyListeners();

      _filterRecipes(state.filterSearchState);
    } catch (e) {
      _eventController.add(SearchRecipesEvent.showErrorMessage(e.toString()));
    }
  }
}
