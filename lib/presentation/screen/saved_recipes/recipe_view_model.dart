import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/repository/recipes_repository.dart';

import '../../../model/recipe.dart';

class RecipeCardViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  final Set<int> bookmarkedIds = {}; // 북마크 상태 저장

  RecipeCardViewModel(this._repository);

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      final fetchedRecipes = await _repository.fetchRecipes();
      _recipes = fetchedRecipes;
    } catch (e) {
      print('Error fetching recipes: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleBookmark(int recipeId) {
    if (bookmarkedIds.contains(recipeId)) {
      bookmarkedIds.remove(recipeId);
    } else {
      bookmarkedIds.add(recipeId);
    }
    notifyListeners();
  }
}