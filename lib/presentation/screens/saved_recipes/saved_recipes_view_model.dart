import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/recipe_repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository);

  List<Recipe> _savedRecipes = [];
  List<Recipe> get saverRecipes => List.unmodifiable(_savedRecipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _savedRecipes = await _recipeRepository.getSavedRecipes();

    _isLoading = false;
    notifyListeners();
  }

}