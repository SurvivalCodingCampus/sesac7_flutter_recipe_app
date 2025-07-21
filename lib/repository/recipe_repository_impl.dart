
import 'dart:convert';

import 'package:flutter_recipe_app/core/api_response.dart';
import 'package:flutter_recipe_app/dto/extension/recipe_mapper.dart';
import 'package:flutter_recipe_app/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/repository/recipe_repository.dart';

import '../data/model/recipe.dart';
import '../data_source/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<ApiResponse<List<Recipe>>> getRecipes() async {
    final response = await _recipeDataSource.getRecipes();

    try {
      if (response.statusCode == 200) {

        if(response.body != null) {
          final List<dynamic> recipesRawList = jsonDecode(response.body!)['recipes'];
          final recipeDtos = recipesRawList.map((e) => RecipeDto.fromJson(e)).toList();
          final recipes = recipeDtos.map((e) => e.toRecipe()).toList();

          return ApiResponse.success(body: recipes);
        } else {
          return ApiResponse.failure(errorMessage: 'response.body is null');
        }
      } else {
        return ApiResponse.failure(errorMessage: 'http status code is not 200');
      }
    } catch (e) {
      return ApiResponse.failure(errorMessage: 'Something went wrong');
    }
  }
}