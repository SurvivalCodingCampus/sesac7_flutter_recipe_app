import 'dart:async';

import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/network_validator_mixin.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/core/data/mapper/recipe/recipe_mapper.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/reopsitory/recipe/recipe_repository.dart';

class RecipeRepositoryImpl
    with NetworkValidatorMixin
    implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<Recipe>, NetworkError>> fetchAllRecipes() async {
    try {
      final response = await _recipeDataSource.fetchAllRecipes();
      final error = checkStatusCodeError(response.statusCode);

      if (error != null) {
        return Result.error(error);
      }

      return Result.success(
        response.body
            .map((e) => e.toModel())
            .where((e) => e.id != Recipe.invalidId)
            .toList(),
      );
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
