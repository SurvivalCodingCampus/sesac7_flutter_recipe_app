import 'package:flutter/material.dart';

import '../../../model/recipe.dart';
import '../../../repository/recipes_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  List<Recipe> _allRecipes = [];

  List<Recipe> get allRecipes => List.unmodifiable(_allRecipes);

  // SearchRecipesState _state = SearchRecipesState.initial();
  // SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._repository);

  List<String> get allCategories {
    final categories = _allRecipes.map((e) => e.category).toSet().toList();
    categories.sort();
    return ['All', ...categories];
  }

  Future<void> loadRecipes() async {
    _allRecipes = await _repository.fetchRecipes();
    notifyListeners();
  }
}
