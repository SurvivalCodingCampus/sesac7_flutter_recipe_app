import 'dart:convert';
import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe/category_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/data/mocks/data/mock_recipe_category_data.dart';
import 'package:flutter_recipe_app/data/mocks/data/mock_recipe_data.dart';

class MockRecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<Response<List<RecipeDto>>> getRecipes() async {
    final Map<String, dynamic> decodedJson = jsonDecode(mockRecipeData);
    final List<dynamic> recipesJsonList =
    decodedJson['recipes'] as List<dynamic>;
    final List<RecipeDto> recipeDto = recipesJsonList
        .map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
        .toList();

    return Response(
      statusCode: 200,
      header: {'Content-Type': 'application/json'},
      body: recipeDto,
    );
  }

  @override
  Future<Response<List<CategoryDto>>> getCategory() async {
    final List<dynamic> categoryJsonList = jsonDecode(mockRecipeCategoryData) as List<dynamic>;

    final List<CategoryDto> categoryDtoList = categoryJsonList
        .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
        .toList();

    return Response(
      statusCode: 200,
      header: {'Content-Type': 'application/json'},
      body: categoryDtoList,
    );
  }
}