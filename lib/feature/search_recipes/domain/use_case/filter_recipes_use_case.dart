import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_sort_by.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';

class FilterRecipesUseCase {
  List<Recipe> execute(
    List<Recipe> original,
    String keyword,
    FilterSearchState filterState,
  ) {
    final lowerCaseKeyword = keyword.toLowerCase();
    var filteredRecipes = original.where(
      (e) =>
          e.name.toLowerCase().contains(lowerCaseKeyword) ||
          e.creator.toLowerCase().contains(lowerCaseKeyword),
    );
    filteredRecipes = _filterRecipesSortedBy(
      filteredRecipes,
      filterState.filterSortBy,
    );
    filteredRecipes = _filterRecipesByRate(
      filteredRecipes,
      filterState.filterRate,
    );
    filteredRecipes = _filterRecipesByCategory(
      filteredRecipes,
      filterState.filterCategory,
    );

    return filteredRecipes.toList();
  }

  Iterable<Recipe> _filterRecipesSortedBy(
    Iterable<Recipe> recipes,
    FilterSortBy sortBy,
  ) {
    return switch (sortBy) {
      FilterSortBy.all => recipes,
      FilterSortBy.newest => recipes,
      FilterSortBy.oldest => recipes,
      FilterSortBy.popularity => recipes,
    };
  }

  Iterable<Recipe> _filterRecipesByRate(
    Iterable<Recipe> recipes,
    FilterRate? filterRate,
  ) {
    if (filterRate == null) return recipes;

    return recipes.where((e) => e.rating.toInt() == filterRate.toInt());
  }

  Iterable<Recipe> _filterRecipesByCategory(
    Iterable<Recipe> recipes,
    FilterCategory filterCategory,
  ) {
    if (filterCategory == FilterCategory.all) return recipes;

    return recipes.where((e) => e.category == filterCategory.toString());
  }
}
