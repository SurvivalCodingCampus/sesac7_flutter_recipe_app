import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';

abstract interface class SavedRecipesRepository {
  Future<List<Recipe>> getRecipes();
}