import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class BookmarkRecipeByIdUseCase {
  final RecipeRepository _recipeRepository;

  BookmarkRecipeByIdUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<bool> execute(int recipeId) async {
    final bool result = await _recipeRepository.addBookmarkRecipe(recipeId);

    return result;
  }
}
