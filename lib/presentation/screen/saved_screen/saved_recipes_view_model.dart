import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipes.dart';

import '../../../data/repository/recipe_repository.dart';

class SavedRecipesScreen with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesScreen({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  // 저장된 레시피 리스트
  List<Recipes> _savedRecipes = [];

  // 저장된 레시피 리스트에 레시피 추가
  List<Recipes> get savedRecipes => _savedRecipes;
}
