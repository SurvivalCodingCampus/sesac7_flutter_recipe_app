

import 'package:flutter_recipe_app/core/response.dart';

abstract interface class RecipeDataSource {
  Future<Response> getRecipes();
}