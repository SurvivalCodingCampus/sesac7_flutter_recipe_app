import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_action.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_event.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveSavedRecipeUseCase _removeSavedRecipeUseCase;
  final StreamController<SavedRecipesEvent> _streamController =
      StreamController.broadcast();

  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required RemoveSavedRecipeUseCase removeSavedRecipeUseCase,
  })  : _getSavedRecipesUseCase = getSavedRecipesUseCase,
        _removeSavedRecipeUseCase = removeSavedRecipeUseCase;

  SavedRecipesState get state => _state;
  Stream<SavedRecipesEvent> get eventStream => _streamController.stream;

  Future<void> init() async {
    _loadingState();

    final result = await _getSavedRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          savedRecipes: result.data,
          isLoading: false,
        );
      case Error<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          savedRecipes: [],
          isLoading: false,
        );
        _streamController.add(SavedRecipesEvent.showErrorDialog(result.error.toString()));
    }

    notifyListeners();
  }

  Future<void> onAction(SavedRecipesAction action) async {
    switch (action) {
      case TapRecipeCard():
        // TODO: Handle this case.
        throw UnimplementedError();
      case TapRecipeBookmark():
        await _removeSavedRecipe(action.recipeId);
    }
  }

  Future<void> _removeSavedRecipe(String id) async {
    _loadingState();

    final result = await _removeSavedRecipeUseCase.execute(
      state.savedRecipes,
      id,
    );

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          savedRecipes: result.data,
          isLoading: false,
        );

      case Error<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          isLoading: false,
        );
        _streamController.add(SavedRecipesEvent.showErrorDialog(result.error.toString()));
    }
    notifyListeners();
  }

  void _loadingState() {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}

