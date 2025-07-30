import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_event.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetAllRecipesUseCase _fetchAllRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;
  final GetRecentSearchKeywordUseCase _fetchRecentSearchKeywordUseCase;
  final SaveSearchKeywordUseCase _saveSearchKeywordUseCase;
  final StreamController<SearchRecipesEvent> _eventController =
      StreamController();
  final Debouncer _debouncer;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesViewModel({
    required GetAllRecipesUseCase fetchAllRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
    required GetRecentSearchKeywordUseCase fetchRecentSearchKeywordUseCase,
    required SaveSearchKeywordUseCase saveSearchKeywordUseCase,
    required Debouncer debouncer,
  }) : _fetchAllRecipesUseCase = fetchAllRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase,
       _fetchRecentSearchKeywordUseCase = fetchRecentSearchKeywordUseCase,
       _saveSearchKeywordUseCase = saveSearchKeywordUseCase,
       _debouncer = debouncer;

  SearchRecipesState get state => _state;
  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  void init() async {
    _loadingState();
    final isSuccess = await _fetchAllRecipes();
    if (!isSuccess) return;
    // 검색기록레포에서 가져오면 use case 하나에서 레포 교체로 가능
    await _fetchRecentSearchKeyword();
  }

  Future<bool> _fetchAllRecipes() async {
    final result = await _fetchAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          resultCount: result.data.length,
          searchState: SearchStateType.recentSearch,
          filterState: const FilterSearchState(),
          isLoading: false,
        );

        notifyListeners();
        return true;
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
        return false;
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
        _debouncer.run(() => _searchRecipe(action.value));
      case TapFilterButton():
        break;
      case SelectFilter():
        _selectFilter(action.state);
    }

    notifyListeners();
  }

  void _searchRecipe(String keyword) {
    _searchWithFilter(keyword, state.filterState);
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
      _eventController.add(SearchRecipesEvent.showNoSearchResultSnackBar());
    }

    if (keyword.trim().isNotEmpty) {
      _saveSearchKeywordUseCase.execute(keyword);
    }

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

    _eventController.add(SearchRecipesEvent.showErrorDialog(message));

    notifyListeners();
  }
}
