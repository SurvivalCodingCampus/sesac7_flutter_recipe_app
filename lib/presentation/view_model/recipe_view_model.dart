import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/state_holder/recipe_view_state.dart';

import '../../core/result.dart';

import '../../domain/repository/recipe_repository.dart';
import '../../domain/model/recipe.dart';

class RecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  RecipeViewState _recipeViewState;

  RecipeViewState get recipeViewState => _recipeViewState;

  RecipeViewModel({
    required RecipeRepository recipeRepository,
    RecipeViewState? initialState,
  }) : _recipeRepository = recipeRepository,
       _recipeViewState = initialState ?? const RecipeViewState();


  void fetchRecipes() async {
    _recipeViewState = recipeViewState.copyWith(isLoading: true);
    notifyListeners();
    final response = await _recipeRepository.getRecipes();

    switch (response) {
      case Success<List<Recipe>, String>():
        if (response.value.isNotEmpty) {
          //_recipes.clear();
          //_recipes.addAll(response.value);
          _recipeViewState = recipeViewState.copyWith(recipes: []);
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
