import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';

class GetRecipesByCategory {
  final GetRecipesUseCase _getRecipesUseCase;

  GetRecipesByCategory({required GetRecipesUseCase getRecipesUseCase})
    : _getRecipesUseCase = getRecipesUseCase;

  Future<Result<List<Recipe>, NetworkError>> execute(String category) async {
    final Result<List<Recipe>, NetworkError> result = await _getRecipesUseCase
        .execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        return Success(
          result.data.where((recipe) => recipe.category == category).toList(),
        );
      case Error<List<Recipe>, NetworkError>():
        return result;
    }
  }
}
