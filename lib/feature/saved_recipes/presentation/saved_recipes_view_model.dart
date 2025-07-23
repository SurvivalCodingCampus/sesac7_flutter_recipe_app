import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase;

  SavedRecipesState get state => _state;

  Future<void> fetchSavedRecipes() async {
    final result = await _getSavedRecipesUseCase.execute();

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
