import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class MockRecipeRepository implements RecipeRepository {
  Result<List<Recipe>, NetworkError> _getRecipesResult;
  Result<List<Recipe>, NetworkError> _searchRecipesResult;
  Result<List<Recipe>, NetworkError> _getRecentRecipesResult;
  Result<List<Recipe>, NetworkError> _addRecentRecipesResult;

  MockRecipeRepository({
    required Result<List<Recipe>, NetworkError> getRecipesResult,
    required Result<List<Recipe>, NetworkError> searchRecipesResult,
    required Result<List<Recipe>, NetworkError> getRecentRecipesResult,
    required Result<List<Recipe>, NetworkError> addRecentRecipesResult,
  }) : _getRecipesResult = getRecipesResult,
       _searchRecipesResult = searchRecipesResult,
       _getRecentRecipesResult = getRecentRecipesResult,
       _addRecentRecipesResult = addRecentRecipesResult;

  @override
  Future<Result<List<Recipe>, NetworkError>> addRecentRecipes(
    List<Recipe> recentRecipes,
  ) async {
    return _addRecentRecipesResult;
  }

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecentRecipes() async {
    return _getRecentRecipesResult;
  }

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    return _getRecipesResult;
  }

  @override
  Future<Result<List<Recipe>, NetworkError>> searchRecipes([
    String? keyword,
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  ]) async {
    return _searchRecipesResult;
  }
}
