import 'package:flutter/material.dart';

import '../../core/result.dart';
import '../../data/model/recipe.dart';
import '../../data/repository/recipe_repository.dart';

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

    switch (response) {

      case Success<List<Recipe>, String>():
        if(response.value.isNotEmpty){
          _recipes.clear();
          _recipes.addAll(response.value);
          notifyListeners();
        }
        break;
      case Failure<List<Recipe>, String>():
        print(response.exception);
        break;
    }
    _isLoading = false;
  }
}
