


import 'package:flutter_recipe_app/core/result.dart';

import '../../core/api_response.dart';
import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, String>> getRecipes();
}