import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/filter_search_state.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/search_recipe_state.dart';

class SearchRecipeViewModel {
  final RecipeRepository _recipeRepository;

  SearchRecipeViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  SearchRecipeState _state = SearchRecipeState();

  SearchRecipeState get state => _state;

  Future<void> fetchRecipe() async {
    _state = _state.copyWith(isLoading: true);
    final result = await _recipeRepository.fetchAllRecipes();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          resultCount: result.data.length,
          searchState: SearchRecipeState.recentSearch,
          filterState: FilterSearchState(),
          isLoading: false,
          errorMessage: null,
        );
      case Error<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: [],
          filteredRecipes: [],
          resultCount: 0,
          searchState: SearchRecipeState.recentSearch,
          isLoading: false,
          errorMessage:
              'Fail to load data from server. Error: ${result.error.toString()}',
        );
    }
  }

  void searchRecipe(String keyword) {
    if (keyword.isEmpty) return;

    final filterdRecipes = state.allRecipes
        .where((e) => e.name.contains(keyword) || e.creator.contains(keyword))
        .toList();
    _state = state.copyWith(
      filteredRecipes: filterdRecipes,
      resultCount: filterdRecipes.length,
      searchFieldValue: keyword,
      searchState: SearchRecipeState.searchResult,
    );
  }

  void selectFilter(FilterSearchState filterState) {
    var filterdRecipes = state.filteredRecipes;
    filterdRecipes = _filterRecipesSortedBy(
      filterdRecipes,
      filterState.filterSortBy,
    );
    filterdRecipes = _filterRecipesByRate(
      filterdRecipes,
      filterState.filterRate,
    );
    filterdRecipes = _filterRecipesByCategory(
      filterdRecipes,
      filterState.filterCategory,
    );
    _state = state.copyWith(
      filteredRecipes: filterdRecipes,
      resultCount: filterdRecipes.length,
      searchState: SearchRecipeState.searchResult,
      filterState: filterState,
    );
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
