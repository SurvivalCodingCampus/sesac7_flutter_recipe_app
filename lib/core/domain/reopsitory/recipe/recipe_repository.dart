import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> fetchAllRecipes();
  Future<Recipe> fetchRecipe(String id);
}
