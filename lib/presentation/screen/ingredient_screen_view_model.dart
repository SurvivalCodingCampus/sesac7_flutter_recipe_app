import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/ingredient_screen_state.dart';

import '../../data/model/procedure.dart';
import '../../data/model/recipe.dart';
import '../../data/repository/recipe_repository.dart';

class IngredientScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final ProcedureRepository _procedureRepository;

  IngredientScreenState _state = const IngredientScreenState();

  IngredientScreenState get state => _state;

  IngredientScreenViewModel({
    required RecipeRepository recipeRepository,
    required ProcedureRepository procedureRepository,
  }) : _recipeRepository = recipeRepository,
       _procedureRepository = procedureRepository;

  Future<void> fetchRecipeById(int id) async {
    _state = state.copyWith(
      indexOfTab: 0,
      isLoading: true,
    );
    notifyListeners();

    final Recipe selectedRecipe = await _recipeRepository.getRecipeById(id);
    final Procedure selectedProcedure = await _procedureRepository
        .getProcedureById(
          id,
        );

    _state = state.copyWith(
      selectedRecipe: selectedRecipe,
      quantityOfItems: '${selectedRecipe.ingredients.length} items',
      steps: selectedProcedure.steps,
      isLoading: false,
    );
    notifyListeners();
  }

  void changeIndexOfTab(int index) {
    _state = state.copyWith(
      indexOfTab: index,
    );
    notifyListeners();

    _state = state.copyWith(
      quantityOfItems: (state.indexOfTab == 0)
          ? '${state.selectedRecipe.ingredients.length} items'
          : '${state.steps.length} steps',
    );
    notifyListeners();
  }
}
