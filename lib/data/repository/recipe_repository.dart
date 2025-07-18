import 'package:flutter_recipe_app/data/model/recipe.dart';

abstract interface class RecipeRepository{
  Future<List<Recipe>> getRecipes();
}