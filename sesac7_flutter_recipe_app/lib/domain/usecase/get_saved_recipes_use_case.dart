import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/domain/usecase/get_user_saved_recipe_ids_use_case.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final GetUserSavedRecipeIdsUseCase _getUserSavedRecipeIdsUseCase;

  GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required GetUserSavedRecipeIdsUseCase getUserSavedRecipeIdsUseCase,
  }) : _recipeRepository = recipeRepository,
       _getUserSavedRecipeIdsUseCase = getUserSavedRecipeIdsUseCase;

  Future<Result<List<Recipe>, String>> execute() async {
    final Result<List<int>, void> savedRecipeIdsResult =
        await _getUserSavedRecipeIdsUseCase.execute();
    final Result<List<Recipe>, NetworkError> recipesResult =
        await _recipeRepository.getRecipes();
    final List<Recipe> savedRecipes = [];
    final List<Recipe> recipes = [];

    switch (recipesResult) {
      case Success<List<Recipe>, NetworkError>():
        recipes.addAll(recipesResult.data);
      case Error<List<Recipe>, NetworkError>():
        break;
    }

    if (recipes.isNotEmpty) {
      switch (savedRecipeIdsResult) {
        case Success<List<int>, void>():
          final List<int> bookmarkRecipeIds = savedRecipeIdsResult.data;
          savedRecipes.addAll(
            recipes
                .where((recipe) => bookmarkRecipeIds.contains(recipe.id))
                .toList(),
          );
          return Success(savedRecipes);
        case Error<List<int>, void>():
          return Success([]);
      }
    } else {
      return Error('전체 레시피가 없습니다.');
    }
  }
}
