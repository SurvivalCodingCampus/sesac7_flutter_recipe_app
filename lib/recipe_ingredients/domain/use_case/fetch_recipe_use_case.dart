import 'dart:async';

import '../../../core/domain/model/ingredient.dart';
import '../../../core/network_error.dart';
import '../../../core/result.dart';
import '../repository/ingredient_repository.dart';

class FetchRecipeIngredientsUseCase {
  final IngredientRepository _ingredientRepository;

  const FetchRecipeIngredientsUseCase({
    required IngredientRepository ingredientRepository,
  }): _ingredientRepository = ingredientRepository;

  Future<Result<List<Ingredient>, NetworkError>> execute(int recipeId) async {
    try {
      final ingredients = await _ingredientRepository.fetchIngredients(recipeId)
          .timeout(const Duration(seconds: 10));
      return Result.success(ingredients);
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }
  }
}