import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class GetRecipeByCategoryUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeByCategoryUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String category) async {
    final allRecipes = await _recipeRepository.getRecipes();

    if(category == "All") {
      return allRecipes;
    }

    return allRecipes
        .where((e) => e.categories.contains(category))
        .toList();
  }
}
