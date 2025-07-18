import 'package:flutter_recipe_app/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/recipe_repository/recipe_repository.dart';

import '../data_source/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  RecipeRepositoryImpl(this._dataSource);

  @override
  Future<List<Recipe>> getSavedRecipes() async {
    final recipeDtos = await _dataSource.getSavedRecipeDtos();

    return recipeDtos.map((dto) => dto.toRecipe()).toList();
  }
  
}