import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;

  Stream<Result<List<Recipe>, NetworkError>> execute() async* {
    try {
      final recipes = await _recipeRepository.fetchAllRecipes();

      await for (final bookmarks in _bookmarkRepository.fetchBookmarks()) {
        final savedRecipes = recipes
            .where(
              (recipe) =>
                  bookmarks.every((bookmark) => bookmark.recipeId == recipe.id),
            )
            .toList();
        yield Result.success(savedRecipes);
      }
    } on TimeoutException {
      yield Result.error(NetworkError.requestTimeout);
    } on FormatException {
      yield Result.error(NetworkError.parseError);
    } on NetworkError catch (e) {
      yield Result.error(e);
    } catch (e) {
      yield Result.error(NetworkError.unknown);
    }
  }
}
