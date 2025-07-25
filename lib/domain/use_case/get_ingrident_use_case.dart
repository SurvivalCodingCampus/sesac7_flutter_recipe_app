import 'package:flutter_recipe_app/core/result.dart';

import '../model/recipe_ingredient.dart';
import '../repository/ingredient_repository.dart';

class GetIngredientsUseCase {
  final IngredientRepository _ingredientRepository;

  GetIngredientsUseCase({
    required IngredientRepository ingredientRepository,
  }) : _ingredientRepository = ingredientRepository;

  Future<List<RecipeIngredient>> getIngredients(String recipeId) async {

    final result = await _ingredientRepository.getIngredients(recipeId);

    switch (result) {

      case Success<List<RecipeIngredient>, String>():
        return result.value;
      case Failure<List<RecipeIngredient>, String>():
        print(result.exception);
        return [];
    }
  }

}