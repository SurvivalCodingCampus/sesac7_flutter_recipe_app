import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  SavedRecipesViewModel({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data;
      case Error<List<Recipe>>():
        _recipes = [];
        _errorMessage = result.message;
    }
    _isLoading = false;
    notifyListeners();
  }
}
