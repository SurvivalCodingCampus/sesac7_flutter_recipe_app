import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_category.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_rate.dart';
import 'package:flutter_recipe_app/data/model/recipe/filter_sort_by.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, NetworkError>> fetchAllRecipes();
  Future<Result<List<Recipe>, NetworkError>> searchRecipes(String keyword);
  Future<Result<List<Recipe>, NetworkError>> filterRecipes({
    required String keyword,
    FilterSortBy? filterSortBy,
    FilterRate? filterRate,
    FilterCategory? filterCategory,
  });
}
