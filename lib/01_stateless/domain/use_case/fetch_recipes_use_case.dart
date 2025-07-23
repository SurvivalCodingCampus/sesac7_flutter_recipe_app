import '../../core/result.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const GetRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();

      if (recipes.isEmpty) {
        return Result.error('레시피가 비었습니다');
      }

      return Result.success(recipes);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
