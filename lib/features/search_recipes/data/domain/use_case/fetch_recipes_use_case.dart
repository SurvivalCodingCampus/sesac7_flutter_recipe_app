import '../../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../../core/data/recipe/domain/repository/recipe_repository.dart';

class FetchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  FetchRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute() async {
    final recipes = await _recipeRepository.getRecipes();

    return recipes;
  }
}
