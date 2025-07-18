import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/data/dto/recipes_dto.dart';

abstract interface class RecipeDataSource {
  Future<Response<RecipesDto>> getRecipes();
}