import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_filter_search_state_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_recent_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_filter_search_state_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_event.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetAllRecipesUseCase _getAllRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;
  final GetRecentSearchKeywordUseCase _getRecentSearchKeywordUseCase;
  final SaveSearchKeywordUseCase _saveSearchKeywordUseCase;
  final GetFilterSearchStateUseCase _getFilterSearchStateUseCase;
  final SaveFilterSearchStateUseCase _saveFilterSearchStateUseCase;
  final StreamController<SearchRecipesEvent> _eventController =
      StreamController();
  final Debouncer _debouncer;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesViewModel({
    required GetAllRecipesUseCase getAllRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
    required GetRecentSearchKeywordUseCase getRecentSearchKeywordUseCase,
    required SaveSearchKeywordUseCase saveSearchKeywordUseCase,
    required GetFilterSearchStateUseCase getFilterSearchStateUseCase,
    required SaveFilterSearchStateUseCase saveFilterSearchStateUseCase,
    required Debouncer debouncer,
  }) : _getAllRecipesUseCase = getAllRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase,
       _getRecentSearchKeywordUseCase = getRecentSearchKeywordUseCase,
       _saveSearchKeywordUseCase = saveSearchKeywordUseCase,
       _getFilterSearchStateUseCase = getFilterSearchStateUseCase,
       _saveFilterSearchStateUseCase = saveFilterSearchStateUseCase,
       _debouncer = debouncer;

  SearchRecipesState get state => _state;
  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  void init() async {
    _loadingState();
    final isSuccess = await _getAllRecipes();
    if (!isSuccess) return;
    // 검색기록레포에서 가져오면 use case 하나에서 레포 교체로 가능
    await _getRecentSearchKeyword();
  }

  Future<bool> _getAllRecipes() async {
    final filterSearchState = await _getFilterSearchState();
    final result = await _getAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          resultCount: result.data.length,
          searchState: SearchStateType.recentSearch,
          filterState: filterSearchState,
          isLoading: false,
        );

        notifyListeners();
        return true;
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
        return false;
    }
  }

  Future<FilterSearchState> _getFilterSearchState() async {
    final result = await _getFilterSearchStateUseCase.execute();

    switch (result) {
      case Success<FilterSearchState, String>():
        return result.data;
      case Error<FilterSearchState, String>():
        return const FilterSearchState();
    }
  }

  Future<void> _getRecentSearchKeyword() async {
    final result = await _getRecentSearchKeywordUseCase.execute();

    switch (result) {
      case Success<String, String>():
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

    _saveSearchKeywordUseCase.execute(keyword);
    _saveFilterSearchStateUseCase.execute(filterState);
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
