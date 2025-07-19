import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';
import 'package:flutter_recipe_app/03_mvvm/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/03_mvvm/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/03_mvvm/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/03_mvvm/data/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  RecipeRepositoryImpl({required RecipeDataSource dataSource})
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
}

void main() async {
  final dataSource = RecipeDataSourceImpl();
  final repository = RecipeRepositoryImpl(dataSource: dataSource);

  final result = await repository.getRecipeById(5);

  print(result);
}
