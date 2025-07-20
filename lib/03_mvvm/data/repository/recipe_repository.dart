import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();

  Future<Recipe> getRecipeById(int id);

  Future<List<Recipe>> getRecipesByName(String name);

  Future<List<Recipe>> getRecipesByChef(String chef);
}
