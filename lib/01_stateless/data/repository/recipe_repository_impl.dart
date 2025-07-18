import 'dart:convert';

import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/01_stateless/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

import '../dto/recipes_response_dto.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final response = await _recipeDataSource.getRecipes();

      final recipesResponseDto = RecipesResponseDto.fromJson(
        jsonDecode(response.body),
      );

      final recipes = recipesResponseDto.toRecipes();

      if (recipes.isEmpty) {
        return Result.error('No recipes found');
      }

      return Result.success(recipes);
    } catch (e) {
      return Result.error('Failed to fetch recipes');
    }
  }
}
