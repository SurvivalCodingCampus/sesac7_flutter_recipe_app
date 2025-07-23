import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}