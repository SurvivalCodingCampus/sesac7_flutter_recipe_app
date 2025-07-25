import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class UnbookmarkRecipeByIdUseCase {
  final RecipeRepository _recipeRepository;

  UnbookmarkRecipeByIdUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<bool> execute(int recipeId) async {
    final bool result = await _recipeRepository.removeBookmarkRecipe(recipeId);

    return result;
  }
}
