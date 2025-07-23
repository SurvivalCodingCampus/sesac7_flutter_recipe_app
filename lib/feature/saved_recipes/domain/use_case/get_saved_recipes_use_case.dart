import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/reopsitory/recipe/recipe_repository.dart';
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

  Future<Result<List<Recipe>, NetworkError>> execute() async {
    try {
      final recipes = await _recipeRepository.fetchAllRecipes();
      final bookmarks = await _bookmarkRepository.fetchBookmarks();
      final savedRecipes = recipes
          .where((recipe) => bookmarks.contains(recipe.id))
          .toList();

      return Result.success(savedRecipes);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on NetworkError catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
