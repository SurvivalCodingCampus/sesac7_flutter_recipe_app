import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';

class FetchRecipeUseCase {
  final RecipeRepository _recipeRepository;

  FetchRecipeUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<Recipe, NetworkError>> execute(
    String recipeId,
  ) async {
    try {
      final recipes = await _recipeRepository.fetchAllRecipes();
      final recipe = recipes.firstWhere((e) => e.id == recipeId);

      return Result.success(recipe);
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
