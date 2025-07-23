import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';

abstract interface class BookmarkRepository {
  Future<Result<List<Recipe>, String>> getBookmarkRecipes();
  Future<Result<void, String>> addBookmarkRecipe(int recipeId);
  Future<Result<void, String>> removeBookmarkRecipe(int recipeId);
}