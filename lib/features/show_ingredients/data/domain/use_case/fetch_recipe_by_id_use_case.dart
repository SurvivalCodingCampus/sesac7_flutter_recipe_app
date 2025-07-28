import 'package:flutter_recipe_app/core/data/recipe/domain/repository/recipe_repository.dart';

import '../../../../../core/data/recipe/domain/model/recipe.dart';

class FetchRecipeByIdUseCase {
  final RecipeRepository _recipeRepository;

  const FetchRecipeByIdUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Recipe> execute(int id) async {
    final Recipe selectedRecipe = await _recipeRepository.getRecipeById(id);

    return selectedRecipe;
  }
}
