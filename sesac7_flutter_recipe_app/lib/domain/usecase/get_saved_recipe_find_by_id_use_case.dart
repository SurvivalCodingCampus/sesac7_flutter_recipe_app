import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';

class GetSavedRecipeFindByIdUseCase {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  GetSavedRecipeFindByIdUseCase({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase;

  Future<Result<Recipe?, String>> execute(int recipeId) async {
    final Result<List<Recipe>, String> result = await _getSavedRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>, String>():
        return Success(result.data.where((recipe) => recipe.id == recipeId).firstOrNull);
      case Error<List<Recipe>, String>():
      return Error(result.error);
    }
  }
}
