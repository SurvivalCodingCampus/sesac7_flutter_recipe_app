import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, NetworkError>> getRecipes();
  Future<Result<List<Recipe>, NetworkError>> searchRecipes(String? keyword, SearchRecipeFilterTimeType? timeType, RatingType? ratingType, SearchRecipeFilterCategoryType? categoryType);
  Future<Result<List<Recipe>, NetworkError>> getRecentRecipes();
  Future<Result<List<Recipe>, NetworkError>> addRecentRecipes(List<Recipe> recentRecipes);
}