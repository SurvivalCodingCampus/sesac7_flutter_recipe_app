import 'dart:async';

import 'package:flutter_recipe_app/core/result.dart';

abstract interface class BookmarkRepository {
  Future<Result<List<int>, String>> getBookmarkRecipesId();

  Future<Result<void, String>> addBookmarkRecipe(int recipeId);

  Future<Result<void, String>> removeBookmarkRecipe(int recipeId);

  Stream<void> getBookmarkChangedStream();
}
