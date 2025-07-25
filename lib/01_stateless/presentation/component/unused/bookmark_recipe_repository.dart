import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';

abstract interface class BookmarkRecipeRepository {

  Future<List<Recipe>> getBookmarkedRecipes();
  Future<bool> isBookmarked(int index);
  Future<bool> addBookmarkRecipe(Recipe recipe);
  Future<bool> removeBookmarkRecipe(int index);
}