import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, String>> getRecipes() async {
    final response = await _recipeRepository.getRecipes();

    return response;
  }
}