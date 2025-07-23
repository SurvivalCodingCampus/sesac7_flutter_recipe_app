import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/ingredient_repository.dart';

class FetchAllIngredientsUseCase {
  final IngredientRepository _ingredientRepository;

  FetchAllIngredientsUseCase({
    required IngredientRepository ingredientRepository,
  }) : _ingredientRepository = ingredientRepository;

  Future<Result<List<Ingredient>, NetworkError>> execute(
    String recipeId,
  ) async {
    try {
      final ingredients = await _ingredientRepository.fetchAllIngredient(
        recipeId,
      );

      return Result.success(ingredients);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on NetworkError catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
