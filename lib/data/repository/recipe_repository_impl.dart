import 'dart:convert';

import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipes_response_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final response = await _recipeDataSource.getRecipes();

      final json = jsonDecode(response.body);
      final recipesResponseDto = RecipesResponseDto.fromJson(json);

      final recipes = recipesResponseDto.toRecipes();

      if (recipes.isEmpty) {
        return Result.error('Not found recipes');
      }

      return Result.success(recipes);
    } catch (e) {
      return Result.error('Failed to fetch recipes');
    }
  }

  @override
  Future<Result<List<Recipe>>> getRecipesWithKeyword(String keyword) async {
    try {
      final response = await _recipeDataSource.getRecipes();

      final json = jsonDecode(response.body); //map
      final recipesResponseDto = RecipesResponseDto.fromJson(json); //object

      final recipes = recipesResponseDto
          .toRecipes()
          .where((e) => e.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();

      if (recipes.isEmpty) {
        return Result.error('Not found recipes');
      }

      return Result.success(recipes);
    } catch (e) {
      return Result.error('Failed to fetch recipes');
    }
  }
}
