import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/reopsitory/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';

class GetAllRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetAllRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NetworkError>> execute() async {
    try {
      final recipes = await _recipeRepository.fetchAllRecipes();

      return Result.success(recipes);
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
