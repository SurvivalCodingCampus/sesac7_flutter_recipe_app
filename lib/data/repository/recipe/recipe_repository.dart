import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, NetworkError>> fetchAllRecipes();
}
