import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NetworkError>> execute() {
    return _recipeRepository.getRecipes();
  }
}
