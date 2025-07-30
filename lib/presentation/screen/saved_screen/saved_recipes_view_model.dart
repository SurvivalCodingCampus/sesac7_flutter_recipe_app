import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipes.dart';

import '../../../core/routing/result.dart';
import '../../../data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  // 저장된 레시피 리스트
  List<Recipes> _savedRecipes = [];

  // 저장된 레시피 리스트에 레시피 추가
  List<Recipes> get savedRecipes => List.unmodifiable(_savedRecipes);

  void fetchSavedRecipes() async {
    final result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success():
        _savedRecipes = result.data;
      case Error():
        _savedRecipes = [];
    }

    notifyListeners();
  }
}
