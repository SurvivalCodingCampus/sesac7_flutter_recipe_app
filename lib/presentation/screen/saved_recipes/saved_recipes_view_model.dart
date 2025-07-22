import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<void> fetchSavedRecipes() async {
    final result = await _recipeRepository.fetchAllRecipes();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(savedRecipes: result.data, errorMessage: null);
      case Error<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          savedRecipes: [],
          errorMessage:
              'Failed to fetch saved recipes with error: ${result.error}',
        );
    }
    notifyListeners();
  }
}
