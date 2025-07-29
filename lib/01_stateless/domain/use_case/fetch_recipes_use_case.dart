import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/result.dart';
import '../../di/di_setup.dart';
import '../model/recipe.dart';
import '../repository/recipe_repository.dart';

part 'fetch_recipes_use_case.g.dart';

@riverpod
Future<Result<List<Recipe>>> getRecipes(Ref ref) async {
  try {
    final recipes = await getIt<RecipeRepository>().getRecipes();

    if (recipes.isEmpty) {
      return Result.error('레시피가 비었습니다');
    }

    return Result.success(recipes);
  } catch (e) {
    return Result.error(e.toString());
  }
}

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const GetRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();

      if (recipes.isEmpty) {
        return Result.error('레시피가 비었습니다');
      }

      return Result.success(recipes);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
