import 'package:flutter_recipe_app/03_mvvm/data/dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> getAllRecipes();
}
