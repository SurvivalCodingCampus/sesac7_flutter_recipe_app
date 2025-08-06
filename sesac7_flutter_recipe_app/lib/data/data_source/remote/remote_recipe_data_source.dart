import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/data/dto/recipes_dto.dart';

abstract interface class RemoteRecipeDataSource {
  Future<Response<RecipesDto>> getRecipes();
}