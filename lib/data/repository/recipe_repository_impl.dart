import 'dart:convert';

import 'package:flutter_recipe_app/data/dto/extension/recipe_mapper.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

import '../../core/result.dart';
import '../../domain/model/recipe.dart';
import '../data_source/recipe_data_source.dart';
import '../dto/recipe_dto.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<Result<List<Recipe>, String>> getRecipes() async {
    final response = await _recipeDataSource.getRecipes();

    try {
      if (response.statusCode == 200) {
        final List<dynamic> recipesRawList = jsonDecode(
          response.body,
        )['recipes'];
        final recipeDtos = recipesRawList
            .map((e) => RecipeDto.fromJson(e))
            .toList();
        final recipes = recipeDtos.map((e) => e.toRecipe()).toList();

        return Success(value: recipes);
      } else {
        return Failure(exception: 'http status code is not 200');
      }
    } catch (e) {
      return Failure(exception: 'Something went wrong');
    }
  }
}
