import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class GetBookmarkedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetBookmarkedRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute() async {
    final result = await _recipeRepository.getBookmarkedRecipes();

    return result;
  }
}
