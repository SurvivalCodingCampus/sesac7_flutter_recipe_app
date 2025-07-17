
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
        final List<dynamic> recipesRawList = jsonDecode(response.body)['recipes'];
        final recipeDtos = recipesRawList.map((e) => RecipeDto.fromJson(e)).toList();
        final recipes = recipeDtos.map((e) => e.toRecipe()).toList();

        // final List<Recipe> recipes = recipesRawList
        //     .map((e) => RecipeDto.fromJson(e as Map<String, dynamic>).toRecipe()) // e도 Map으로 캐스팅
        //     .cast<Recipe>() // Iterable<dynamic> (또는 Object)을 Iterable<Recipe>로 캐스팅 시도
        //     .toList();

        // final recipesRawList = jsonDecode(response.body)['recipes'];
        // final List<Recipe> recipes = recipesRawList.map((e) => (RecipeDto.fromJson(e)).toRecipe()).toList();
        return ApiResponse.success(data: recipes);
      } else {
        return ApiResponse.failure(errorMessage: 'Something went wrong');
      }
    } catch (e) {
      return ApiResponse.failure(errorMessage: 'Something went wrong');
    }

/*    return _recipeDataSource.getRecipes().then((response) {
      try {
        if (response.statusCode == 200) {
          final recipesRawList = jsonDecode(response.body)['recipes'];
          final recipes = recipesRawList.map((e) => (RecipeDto.fromJson(e)).toRecipe()).toList();
          return ApiResponse.success(data: recipes);
        } else {
          return ApiResponse.failure(errorMessage: 'Something went wrong');
        }
      } catch (e) {
        return ApiResponse.failure(errorMessage: 'Something went wrong');
      }

    });*/
  }
}