import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipes_remove_by_recipe_id.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/state_holder/recipe_view_state.dart';

import '../../core/result.dart';

import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_recipe_by_recipe_id.dart';

class RecipeViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final GetRecipesRemoveByRecipeId _getRecipesRemoveByRecipeId;
  final GetRecipeByRecipeId _getRecipeByRecipeId;

  RecipeViewState _recipeViewState;

  RecipeViewState get recipeViewState => _recipeViewState;

  RecipeViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required GetRecipesRemoveByRecipeId getRecipesRemoveByRecipeId,
    required GetRecipeByRecipeId getRecipeByRecipeId,
    RecipeViewState? initialState,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
        _getRecipesRemoveByRecipeId = getRecipesRemoveByRecipeId,
        _getRecipeByRecipeId = getRecipeByRecipeId,
       _recipeViewState = initialState ?? const RecipeViewState();

  Recipe? getRecipeByRecipeId(String recipeId) {
    return _getRecipeByRecipeId.getRecipeByRecipeId(recipeId, _recipeViewState.recipes);
  }

  void saveRecipe(String recipeId) async {
    final response = _getRecipesRemoveByRecipeId.getRecipesRemoveByRecipeId(
      recipeId,
      _recipeViewState.recipes,
    );
    _recipeViewState = recipeViewState.copyWith(recipes: response);
    notifyListeners();
  }

  void fetchRecipes() async {
    _recipeViewState = recipeViewState.copyWith(isLoading: true);
    notifyListeners();
    final response = await _getSavedRecipesUseCase.getRecipes();

    switch (response) {
      case Success<List<Recipe>, String>():
        if (response.value.isNotEmpty) {
          _recipeViewState = recipeViewState.copyWith(recipes: response.value);
          notifyListeners();
        }
        break;
      case Failure<List<Recipe>, String>():
        print(response.exception);
        break;
    }

    _recipeViewState = recipeViewState.copyWith(isLoading: false);
    notifyListeners();
  }
}
