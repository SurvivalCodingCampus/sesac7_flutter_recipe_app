import 'package:flutter_recipe_app/data/data_source/remote/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipes_repository.dart';
import '../mapper/recipe_mapper.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<List<Recipe>> fetchRecipes() async {
    final dto = await _recipeDataSource.fetchRecipes();
    final result = dto.recipes ?? [];
    return result.map((dto) => dto.toModel()).toList();
  }
}
