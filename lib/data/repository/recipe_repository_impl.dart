import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository.dart';

import '../data_source/local/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository{
  final RecipeDataSource dataSource;

  RecipeRepositoryImpl(this.dataSource);

  @override
  Future<List<Recipe>> getRecipes() {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }

}