import 'package:flutter_recipe_app/01_stateless/domain/repository/recipe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/result.dart';
import '../../di/di_setup.dart';
import '../model/recipe.dart';

part 'get_recipe_use_case.g.dart';

@riverpod
Future<Result<Recipe>> getRecipe(Ref ref, int id) async {
  final RecipeRepository recipeRepository = getIt();
  try {
    final recipe = await recipeRepository.getRecipe(id);
    return Result.success(recipe);
  } catch (e) {
    return Result.error(e.toString());
  }
}

class GetRecipeUseCase {
  final RecipeRepository _recipeRepository;

  const GetRecipeUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<Recipe>> execute(int id) async {
    try {
      final recipe = await _recipeRepository.getRecipe(id);
      return Result.success(recipe);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
