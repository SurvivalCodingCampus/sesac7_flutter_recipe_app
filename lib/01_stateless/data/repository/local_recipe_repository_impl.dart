import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/domain/repository/recipe_repository.dart';

import '../data_source/db/dao/recipe_dao.dart';

class LocalRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDao _recipeDao;

  LocalRecipeRepositoryImpl(this._recipeDao);

  @override
  Future<Recipe> getRecipe(int id) async {
    final recipeEntity = await _recipeDao.findRecipeById(id);
    if (recipeEntity != null) {
      return recipeEntity.toModel();
    } else {
      throw Exception('Recipe not found');
    }
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipeEntities = await _recipeDao.getAllRecipes();
    return recipeEntities.map((entity) => entity.toModel()).toList();
  }
}
