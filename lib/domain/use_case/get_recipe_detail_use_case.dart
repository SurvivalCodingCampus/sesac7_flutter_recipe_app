import '../../core/result.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';

class GetRecipeDetailUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeDetailUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Recipe?> getRecipe(String recipeId) async {
    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Success<List<Recipe>, String>():
        return result.value.firstWhere((recipe) => recipe.id.toString() == recipeId);
      case Failure<List<Recipe>, String>():
        print(result.exception);
        return null;
    }
  }
}