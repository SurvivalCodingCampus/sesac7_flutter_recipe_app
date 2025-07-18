import 'package:flutter_recipe_app/data/model/recipe.dart';

import '../recipe_dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> getSavedRecipeDtos();
}