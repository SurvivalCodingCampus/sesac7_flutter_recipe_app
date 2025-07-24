import 'dart:async';

import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/core/data/data_source/remote/recipe_data_source.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipes_repository.dart';
import '../mapper/recipe_mapper.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<Result<List<Recipe>, NetworkError>> fetchRecipes() async {
    // final dto = await _recipeDataSource.fetchRecipes();
    // final result = dto.body.recipes ?? [];
    // final recipes = result.map((dto) => dto.toModel()).toList();

    try {
      final dto = await _recipeDataSource.fetchRecipes()
          .timeout(const Duration(seconds: 10));

      if (dto.statusCode >= 200 && dto.statusCode < 300) {
        final result = dto.body.recipes ?? [];
        final recipes = result.map((dto) => dto.toModel()).toList();
        return Result.success(recipes);
      } else {
        final errorType = statusCodeToError(dto.statusCode);
        return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }
  }

  @override
  Future<Result<Recipe, NetworkError>> fetchRecipeById(int id) async {
    final result = await fetchRecipes();
    return result.when(
      success: (List<Recipe> value) {
        final recipe = value.firstWhere((recipe) => recipe.id == id);
        return Result.success(recipe);
      },
      failure: (NetworkError error) {
        return Result.failure(error);
      }
    );
  }
}
