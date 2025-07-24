
import 'dart:convert';

import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/extension/recipe_mapper.dart';
import 'package:flutter_recipe_app/domain/repository/ingredient_repository.dart';

import '../../core/result.dart';
import '../../domain/model/recipe_ingredient.dart';
import '../dto/recipe_dto.dart';

class IngredientRepositoryImpl implements IngredientRepository {

  final RecipeDataSource _recipeDataSource;

  IngredientRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Result<List<RecipeIngredient>, String>> getIngredients(String recipeId) async {
    try {
      final response = await _recipeDataSource.getRecipes();

      if (response.statusCode == 200) {
        final List<dynamic> recipesRawList = jsonDecode(
          response.body,
        )['recipes'];
        final recipeDtos = recipesRawList
            .map((e) => RecipeDto.fromJson(e))
            .toList();
        final recipes = recipeDtos.map((e) => e.toRecipe()).toList();
        final recipe = recipes.firstWhere((recipe) => recipe.id.toString() == recipeId);

        return Success(value: recipe.ingredients);
      } else {
        return Failure(exception: 'http status code is not 200');
      }
    } catch (e) {
      return Failure(exception: 'Something went wrong');
    }
  }



}