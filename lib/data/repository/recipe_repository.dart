import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();

  Future<Result<List<Recipe>>> getRecipesWithKeyword(String keyword);
}
