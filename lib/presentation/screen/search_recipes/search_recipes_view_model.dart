import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/model/recipe/search_state_type.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/filter_search_state.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<void> fetchRecipe() async {
    _state = _state.copyWith(isLoading: true);
    final result = await _recipeRepository.fetchAllRecipes();

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
    if (keyword.isEmpty) {
      _state = state.copyWith(
        filteredRecipes: state.allRecipes,
        resultCount: state.allRecipes.length,
        searchFieldValue: keyword,
        searchState: SearchStateType.recentSearch,
      );
      notifyListeners();
      return;
    }

    var lowerCaseKeyword = keyword.toLowerCase();
    final filteredRecipes = state.allRecipes
        .where(
          (e) =>
              e.name.toLowerCase().contains(lowerCaseKeyword) ||
              e.creator.toLowerCase().contains(lowerCaseKeyword),
        )
        .toList();
    _state = state.copyWith(
      filteredRecipes: filteredRecipes,
      resultCount: filteredRecipes.length,
      searchFieldValue: keyword,
      searchState: SearchStateType.searchResult,
    );

    notifyListeners();
  }

  void selectFilter(FilterSearchState filterState) {
    var recipes = state.allRecipes;
    recipes = _filterRecipesSortedBy(
      recipes,
      filterState.filterSortBy,
    );
    recipes = _filterRecipesByRate(
      recipes,
      filterState.filterRate,
    );
    recipes = _filterRecipesByCategory(
      recipes,
      filterState.filterCategory,
    );
    _state = state.copyWith(
      filteredRecipes: recipes,
      resultCount: recipes.length,
      searchState: SearchStateType.searchResult,
      filterState: filterState,
    );

    notifyListeners();
  }

  List<Recipe> _filterRecipesSortedBy(
    List<Recipe> recipes,
    FilterSortBy sortBy,
  ) {
    return switch (sortBy) {
      FilterSortBy.all => recipes,
      FilterSortBy.newest => recipes,
      FilterSortBy.oldest => recipes,
      FilterSortBy.popularity => recipes,
    };
  }

  List<Recipe> _filterRecipesByRate(
    List<Recipe> recipes,
    FilterRate? filterRate,
  ) {
    if (filterRate == null) return recipes;

    return switch (filterRate) {
      FilterRate.one => recipes.where((e) => e.rating < 2).toList(),
      FilterRate.two =>
        recipes.where((e) => e.rating >= 2 && e.rating < 3).toList(),
      FilterRate.three =>
        recipes.where((e) => e.rating >= 3 && e.rating < 4).toList(),
      FilterRate.four =>
        recipes.where((e) => e.rating >= 4 && e.rating < 5).toList(),
      FilterRate.five => recipes.where((e) => e.rating >= 5).toList(),
    };
  }

  List<Recipe> _filterRecipesByCategory(
    List<Recipe> recipes,
    FilterCategory filterCategory,
  ) {
    if (filterCategory == FilterCategory.all) return recipes;

    return recipes
        .where((e) => e.category == filterCategory.toString())
        .toList();
  }
}
