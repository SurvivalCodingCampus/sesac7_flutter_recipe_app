import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipeByKeywordUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipeByKeywordUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NetworkError>> execute(String keyword) async {
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .searchRecipes(keyword, null, null, null);
    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        return Success(result.data);
      case Error<List<Recipe>, NetworkError>():
        return Error(result.error);
    }
  }
}
