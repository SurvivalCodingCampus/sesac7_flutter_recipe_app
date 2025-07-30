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

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success(data: final result):
        _savedRecipes = result;
      case Error(error: final error):
        _savedRecipes = [];
        _errorMessage = error.toString();
    }
    _isLoading = false;

    notifyListeners();
  }
}
