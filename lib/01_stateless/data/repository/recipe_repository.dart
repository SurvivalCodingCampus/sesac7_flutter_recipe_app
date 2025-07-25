import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> getRecipeById(int id);
  Future<List<Recipe>> getBookmarkedRecipes();
  Future<bool> isBookmarked(int id);
  Future<bool> addBookmarkRecipe(int id);
  Future<bool> removeBookmarkRecipe(int id);
}