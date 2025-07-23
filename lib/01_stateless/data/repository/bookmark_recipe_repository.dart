import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';

abstract interface class BookmarkRecipeRepository {
  Future<List<Recipe>> getBookmarkedRecipes();

  Future<bool> addBookmarkRecipe(int index);
  Future<bool> removeBookmarkRecipe(int index);
}