import '../../core/result.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';

class GetHomeRecipeUseCase {
  final RecipeRepository _recipeRepository;

  const GetHomeRecipeUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> getRecipes() async {
    final response = await _recipeRepository.getRecipes();

    switch (response) {
      case Success<List<Recipe>, String>():
        return response.value;
      case Failure<List<Recipe>, String>():
        return [];
    }
  }
}
