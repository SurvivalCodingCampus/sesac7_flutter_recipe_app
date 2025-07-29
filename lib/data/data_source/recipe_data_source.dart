import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';

import '../../core/routing/response.dart';

abstract interface class RecipeDataSource {
  Future<Response<RecipeDto>> getRecipes();
}
