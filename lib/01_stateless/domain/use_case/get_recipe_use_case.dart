import 'package:flutter_recipe_app/01_stateless/domain/repository/recipe_repository.dart';

import '../../core/result.dart';
import '../model/recipe.dart';

class GetRecipeUseCase {
  final RecipeRepository _recipeRepository;

  const GetRecipeUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<Recipe>> execute(int id) async {
    try {
      final recipe = await _recipeRepository.getRecipe(id);
      return Result.success(recipe);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
