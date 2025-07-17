import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  List<Recipe> _savedRecipes = [];
  String? _errorMessage;

  List<Recipe> get savedRecipes => List.unmodifiable(_savedRecipes);
  String? get errorMessage => _errorMessage;

  Future<void> fetchSavedRecipes() async {
    final result = await _recipeRepository.fetchAllRecipes();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _savedRecipes = result.data;
        notifyListeners();
        return;
      case Error<List<Recipe>, NetworkError>():
        _errorMessage =
            'Failed to fetch saved recipes with error: ${result.error}';
        notifyListeners();
        return;
    }
  }
}
