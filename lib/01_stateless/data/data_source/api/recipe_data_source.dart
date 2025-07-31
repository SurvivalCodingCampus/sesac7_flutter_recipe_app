import 'package:flutter_recipe_app/01_stateless/core/response.dart';

abstract interface class RecipeDataSource {
  Future<Response> getRecipes();
}
