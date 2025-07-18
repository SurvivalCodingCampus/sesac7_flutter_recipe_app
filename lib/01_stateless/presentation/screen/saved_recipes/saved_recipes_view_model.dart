import 'dart:collection';

import 'package:flutter/material.dart';

import '../../../data/model/recipe.dart';
import '../../../data/repository/saved_recipes_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  SavedRecipesRepository _repo;

  SavedRecipesViewModel({
    required SavedRecipesRepository repo,
  }) : _repo = repo;

  List<Recipe> _recipes = [];
  bool _isLoading = false;

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);
  bool get isLoading => _isLoading;

  Future<void> fetchRecipeData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _repo.getRecipes();
    _isLoading = false;
    notifyListeners();
  }

  set repo(SavedRecipesRepository s) {
    _repo = s;
  }


}