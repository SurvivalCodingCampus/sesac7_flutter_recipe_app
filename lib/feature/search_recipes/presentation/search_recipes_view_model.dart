import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/use_case/fetch_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/fetch_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_event.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final FetchAllRecipesUseCase _fetchAllRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;
  final FetchRecentSearchKeywordUseCase _fetchRecentSearchKeywordUseCase;
  final SaveSearchKeywordUseCase _saveSearchKeywordUseCase;
  final StreamController<SearchRecipesEvent> _streamController =
      StreamController();
  final Debouncer _debouncer;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesViewModel({
    required FetchAllRecipesUseCase fetchAllRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
    required FetchRecentSearchKeywordUseCase fetchRecentSearchKeywordUseCase,
    required SaveSearchKeywordUseCase saveSearchKeywordUseCase,
    required Debouncer debouncer,
  }) : _fetchAllRecipesUseCase = fetchAllRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase,
       _fetchRecentSearchKeywordUseCase = fetchRecentSearchKeywordUseCase,
       _saveSearchKeywordUseCase = saveSearchKeywordUseCase,
       _debouncer = debouncer;

  SearchRecipesState get state => _state;
  Stream<SearchRecipesEvent> get eventStream => _streamController.stream;

  void init() async {
    _loadingState();
    await _fetchAllRecipes();
    await _fetchRecentSearchKeyword();
  }

  Future<void> _fetchAllRecipes() async {
    final result = await _fetchAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          resultCount: result.data.length,
          searchState: SearchStateType.recentSearch,
          filterState: FilterSearchState(),
          isLoading: false,
        );

        notifyListeners();
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  Future<void> _fetchRecentSearchKeyword() async {
    final result = await _fetchRecentSearchKeywordUseCase.execute();

    switch (result) {
      case Success<String, String>():
        if (result.data.isEmpty) {
          return;
        }

        _searchRecipe(result.data);
      case Error<String, String>():
        _errorState(result.error);
    }
  }

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case ChangeSearchValue():
        _searchRecipe(action.value);
      case TapFilterButton():
        break;
      case SelectFilter():
        _selectFilter(action.state);
    }

    notifyListeners();
  }

  void _searchRecipe(String keyword) {
    _debouncer.run(
      () => _searchWithFilter(keyword, state.filterState),
    );
  }

  void _selectFilter(FilterSearchState filterState) {
    _searchWithFilter(state.searchFieldValue, filterState);
  }

  void _searchWithFilter(String keyword, FilterSearchState filterState) {
    final filteredRecipes = _filterRecipesUseCase.execute(
      state.allRecipes,
      keyword,
      filterState,
    );
    _state = state.copyWith(
      filteredRecipes: filteredRecipes,
      resultCount: filteredRecipes.length,
      searchFieldValue: keyword,
      searchState: SearchStateType.searchResult,
      filterState: filterState,
      isLoading: false,
    );

    if (filteredRecipes.isEmpty) {
      _streamController.add(SearchRecipesEvent.showNoSearchResultSnackBar());
    }

    _saveSearchKeywordUseCase.execute(keyword);
    notifyListeners();
  }

  void _loadingState() {
    _state = state.copyWith(isLoading: true);

    notifyListeners();
  }

  void _errorState(String message) {
    _state = state.copyWith(
      allRecipes: [],
      filteredRecipes: [],
      resultCount: 0,
      searchState: SearchStateType.recentSearch,
      isLoading: false,
    );

    _streamController.add(SearchRecipesEvent.showErrorDialog(message));

    notifyListeners();
  }
}
