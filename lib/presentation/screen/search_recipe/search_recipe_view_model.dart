import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/search_recipe_state.dart';

class SearchRecipeViewModel {
  final RecipeRepository _recipeRepository;

  SearchRecipeViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  SearchRecipeState _state = SearchRecipeState();

  SearchRecipeState get state => _state;

  Future<void> searchRecipe() async {
    _state = _state.copyWith(isLoading: true);
    final result = await _recipeRepository.searchRecipes(
      _state.searchFieldValue,
    );

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _successState(result.data);
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  Future<void> selectFilter({
    FilterSortBy? filterSortBy,
    FilterRate? filterRate,
    FilterCategory? filterCategory,
  }) async {
    _state = _state.copyWith(
      isLoading: true,
      filterSortBy: filterSortBy ?? _state.filterSortBy,
      filterRate: filterRate ?? _state.filterRate,
      filterCategory: filterCategory ?? _state.filterCategory,
    );
    final result = await _recipeRepository.filterRecipes(
      keyword: _state.searchFieldValue,
      filterSortBy: _state.filterSortBy,
      filterRate: _state.filterRate,
      filterCategory: _state.filterCategory,
    );

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _successState(result.data);
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  void _successState(List<Recipe> recipes) {
    _state = _state.copyWith(
      recipes: recipes,
      resultCount: recipes.length,
      searchState: SearchRecipeState.searchResult,
      isLoading: false,
      errorMessage: null,
    );
  }

  void _errorState(String errorMessage) {
    _state = _state.copyWith(
      recipes: [],
      resultCount: 0,
      searchState: SearchRecipeState.recentSearch,
      isLoading: false,
      errorMessage: 'Fail to load data from server. Error: $errorMessage',
    );
  }
}
