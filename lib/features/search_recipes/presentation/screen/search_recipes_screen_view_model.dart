import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/use_case/fetch_recipes_use_case.dart';
import 'package:flutter_recipe_app/features/search_recipes/data/domain/use_case/filter_recipes_use_case.dart';
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
  final FetchRecipesUseCase _fetchRecipesUseCase;
  final _eventController = StreamController<SearchRecipesEvent>();

  StreamController<SearchRecipesEvent> get eventStream => _eventController;

  SearchRecipesScreenState _state = const SearchRecipesScreenState();

  SearchRecipesScreenState get state => _state;

  SearchRecipesScreenViewModel({
    required SearchRecipesUseCase searchRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
    required FetchRecipesUseCase fetchRecipesUseCase,
  }) : _searchRecipesUseCase = searchRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase,
       _fetchRecipesUseCase = fetchRecipesUseCase;

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
      isInit: true,
    );
    notifyListeners();

    final List<Recipe> recipes = await _fetchRecipesUseCase.execute();

    _state = state.copyWith(
      recipes: recipes,
      filteredResult: recipes,
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

    // 검색이 한 번이라도 실행되었으면 Init 스위치를 끈다
    if (state.query.isNotEmpty) {
      _state = state.copyWith(
        isInit: false,
      );
    }

    // 첫 검색 전까지는 전체 목록으로 필터링한다
    final List<Recipe> baseList = (state.isInit)
        ? state.recipes
        : state.searchedResult;

    // 필터링 로직
    final filteredList = _filterRecipesUseCase.execute(state, baseList);

    _state = state.copyWith(
      filteredResult: filteredList,
      searchLabel:
          (state.recipes.length == filteredList.length && state.query.isEmpty)
          ? 'Recent Search'
          : 'Search Result',
      countingLabel:
          (state.query.isEmpty &&
              state.filterSearchState.selectedRatingFilter == null)
          ? ''
          : '${filteredList.length} recipes',
    );
    notifyListeners();

    if (state.filteredResult.isEmpty) {
      _eventController.add(SearchRecipesEvent.hasNoResult());
    }
  }

  void _search(String query) {
    try {
      final searchedResult = _searchRecipesUseCase.execute(state, query);

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
