import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_screen/saved_recipes_state.dart';

import '../../../core/routing/result.dart';
import '../../../data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  void fetchSavedRecipes() async {
    _state = _state.copyWith(
      savedRecipes: [],
      isLoading: true,
      errorMessage: null,
    );
    notifyListeners();

    final result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success():
        _state = _state.copyWith(
          savedRecipes: result.data,
          isLoading: false,
          errorMessage: null,
        );
      case Error():
        _state = _state.copyWith(
          savedRecipes: [],
          errorMessage: result.error.toString(),
        );
    }
    notifyListeners();
  }
}
