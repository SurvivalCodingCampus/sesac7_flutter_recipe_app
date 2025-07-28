import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/use_case/fetch_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_event.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final FetchAllRecipesUseCase _fetchAllRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;
  final StreamController<SearchRecipesEvent> _streamController =
      StreamController();
  final Debouncer _debouncer;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesViewModel({
    required FetchAllRecipesUseCase fetchAllRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
    required Debouncer debouncer,
  }) : _fetchAllRecipesUseCase = fetchAllRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase,
       _debouncer = debouncer;

  SearchRecipesState get state => _state;
  Stream<SearchRecipesEvent> get eventStream => _streamController.stream;

  void init() async {
    _loadingState();

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
    );

    if (filteredRecipes.isEmpty) {
      _streamController.add(SearchRecipesEvent.showNoSearchResultSnackBar());
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

    _streamController.add(SearchRecipesEvent.showErrorDialog(message));

    notifyListeners();
  }
}
