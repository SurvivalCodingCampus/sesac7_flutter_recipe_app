import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';

class GetRecipesCategoryListUseCase {
  final GetRecipesUseCase _getRecipesUseCase;

  GetRecipesCategoryListUseCase({
    required GetRecipesUseCase getRecipesUseCase,
  }) : _getRecipesUseCase = getRecipesUseCase;

  Future<Result<Set<String>, NetworkError>> execute() async {
    final Result<List<Recipe>, NetworkError> result = await _getRecipesUseCase.execute();
    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        return Success(result.data.map((recipe) => recipe.category).toSet());
      case Error<List<Recipe>, NetworkError>():
        return Error(result.error);
    }
  }
}
