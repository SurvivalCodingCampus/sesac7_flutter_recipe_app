import 'package:flutter/material.dart';

import '../../data/model/recipe.dart';
import '../../repository/recipe_repository.dart';

class RecipeViewModel with ChangeNotifier{
  final RecipeRepository _recipeRepository;

  RecipeViewModel(this._recipeRepository);

  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();
    final response = await _recipeRepository.getRecipes();
    final responseData = response.body;
    if (response.isSuccess && responseData != null && responseData.isNotEmpty) {
      _recipes.clear();
      _recipes.addAll(responseData);
      notifyListeners();
    }
    _isLoading = false;
  }
}
