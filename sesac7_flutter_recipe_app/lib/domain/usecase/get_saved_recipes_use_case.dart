import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;
  final RecipeRepository _recipeRepository;

  GetSavedRecipesUseCase({
    required BookmarkRepository bookmarkRepository,
    required RecipeRepository recipeRepository,
  }) : _bookmarkRepository = bookmarkRepository,
       _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, String>> execute() async {
    final Result<List<int>, String> bookmarkRecipeIdsResult =
        await _bookmarkRepository.getBookmarkRecipesId();
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
      switch (bookmarkRecipeIdsResult) {
        case Success<List<int>, String>():
          final List<int> bookmarkRecipeIds = bookmarkRecipeIdsResult.data;
          savedRecipes.addAll(
            recipes
                .where((recipe) => bookmarkRecipeIds.contains(recipe.id))
                .toList(),
          );
          return Success(savedRecipes);
        case Error<List<int>, String>():
          return Success([]);
      }
    } else {
      return Error('전체 레시피가 없습니다.');
    }
  }
}
