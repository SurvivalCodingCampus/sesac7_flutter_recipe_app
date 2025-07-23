import 'dart:async';

import 'package:flutter_recipe_app/core/utils/network_validator_mixin.dart';
import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/core/data/mapper/recipe/recipe_mapper.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';

class RecipeRepositoryImpl
    with NetworkValidatorMixin
    implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> fetchAllRecipes() async {
    final response = await _recipeDataSource.fetchAllRecipes();
    final error = checkStatusCodeError(response.statusCode);

    if (error != null) {
      throw error;
    }

    return response.body
        .map((e) => e.toModel())
        .where((e) => e.id != Recipe.invalidId)
        .toList();
  }
}
