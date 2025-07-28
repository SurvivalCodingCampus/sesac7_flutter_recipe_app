import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';

class RemoveSavedRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  RemoveSavedRecipeUseCase({required BookmarkRepository bookmarkRepository})
    : _bookmarkRepository = bookmarkRepository;

  Future<Result<List<Recipe>, NetworkError>> execute(
    List<Recipe> recipes,
    String recipeId,
  ) async {
    try {
      await _bookmarkRepository.removeBookmarks(recipeId);

      final updatedRecipes = recipes.where((e) => e.id != recipeId).toList();

      return Result.success(updatedRecipes);
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
