import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';

import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, NetworkError>> fetchRecipes();
  Future<Result<Recipe, NetworkError>> fetchRecipeById(int id);
}