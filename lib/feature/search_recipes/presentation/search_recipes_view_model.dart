import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetAllRecipesUseCase _getAllRecipesUseCase;
  final FilterRecipesUseCase _filterRecipesUseCase;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesViewModel({
    required GetAllRecipesUseCase getAllRecipesUseCase,
    required FilterRecipesUseCase filterRecipesUseCase,
  }) : _getAllRecipesUseCase = getAllRecipesUseCase,
       _filterRecipesUseCase = filterRecipesUseCase;

  SearchRecipesState get state => _state;

  void fetchRecipe() async {
    _state = _state.copyWith(isLoading: true);
    final result = await _getAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          resultCount: result.data.length,
          searchState: SearchStateType.recentSearch,
          filterState: FilterSearchState(),
          isLoading: false,
          errorMessage: null,
        );
      case Error<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: [],
          filteredRecipes: [],
          resultCount: 0,
          searchState: SearchStateType.recentSearch,
          isLoading: false,
          errorMessage:
              'Fail to load data from server. Error: ${result.error.toString()}',
        );
    }

    notifyListeners();
  }

  void searchRecipe(String keyword) {
    _searchWithFilter(keyword, state.filterState);
  }

  void selectFilter(FilterSearchState filterState) {
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

    notifyListeners();
  }
}
