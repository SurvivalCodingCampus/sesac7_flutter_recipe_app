import 'package:flutter_recipe_app/core/utils/response.dart';
import 'package:flutter_recipe_app/core/data/dto/recipe/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<Response<List<RecipeDto>>> fetchAllRecipes();
}
