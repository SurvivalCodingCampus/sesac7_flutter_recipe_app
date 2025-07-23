import 'package:flutter_recipe_app/01_stateless/core/result.dart';

import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
