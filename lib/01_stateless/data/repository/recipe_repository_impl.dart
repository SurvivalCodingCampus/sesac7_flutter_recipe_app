import 'dart:convert';

import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/01_stateless/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/domain/repository/recipe_repository.dart';

import '../dto/recipes_response_dto.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final response = await _recipeDataSource.getRecipes();

    final recipesResponseDto = RecipesResponseDto.fromJson(
      jsonDecode(response.body),
    );

    return recipesResponseDto.toRecipes();
  }
}
