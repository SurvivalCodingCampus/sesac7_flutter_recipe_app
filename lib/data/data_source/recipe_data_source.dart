

import 'package:flutter_recipe_app/core/response.dart';

import '../../core/api_response.dart';

abstract interface class RecipeDataSource {
  Future<Response> getRecipes();
}