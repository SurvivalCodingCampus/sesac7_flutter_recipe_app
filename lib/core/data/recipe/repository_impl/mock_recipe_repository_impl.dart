import 'package:flutter_recipe_app/core/data/recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/core/data/recipe/mapper/recipe_mapper.dart';

import '../data_source/recipe_data_source.dart';
import '../domain/model/recipe.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  MockRecipeRepositoryImpl({required RecipeDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final result = await _dataSource.getAllRecipes();

    return result.map((e) => e.toModel(e.recipes?.first.id as int)).toList();
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    final listOfModels = await _dataSource.getAllRecipes();
    final result = listOfModels
        .map((e) => e.toModel(e.recipes?.first.id as int))
        .toList();

    return result.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Recipe>> getRecipesByName(String name) async {
    final listOfModels = await _dataSource.getAllRecipes();
    final result = listOfModels
        .map((e) => e.toModel(e.recipes?.first.id as int))
        .toList();

    return result
        .where(
          (e) => e.name
              .replaceAll(' ', '')
              .toLowerCase()
              .contains(name.toLowerCase()),
        )
        .toList();
  }

  @override
  Future<List<Recipe>> getRecipesByChef(String chef) async {
    final listOfModels = await _dataSource.getAllRecipes();
    final result = listOfModels
        .map((e) => e.toModel(e.recipes?.first.id as int))
        .toList();

    return result
        .where(
          (e) => e.chef
              .replaceAll(' ', '')
              .toLowerCase()
              .contains(chef.toLowerCase()),
        )
        .toList();
  }
}
