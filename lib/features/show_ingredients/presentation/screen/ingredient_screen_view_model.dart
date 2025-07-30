import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_ingredients/data/domain/use_case/fetch_procedure_by_id_use_case.dart';
import 'package:flutter_recipe_app/features/show_ingredients/data/domain/use_case/fetch_recipe_by_id_use_case.dart';
import 'package:flutter_recipe_app/features/show_ingredients/presentation/screen/ingredient_event.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../data/procedure/domain/model/procedure.dart';
import 'ingredient_action.dart';
import 'ingredient_screen_state.dart';

class IngredientScreenViewModel with ChangeNotifier {
  final FetchRecipeByIdUseCase _fetchRecipeByIdUseCase;
  final FetchProcedureByIdUseCase _fetchProcedureByIdUseCase;
  final _events = StreamController<IngredientEvent>();

  Stream<IngredientEvent> get events => _events.stream;

  IngredientScreenState _state = const IngredientScreenState();

  IngredientScreenState get state => _state;

  IngredientScreenViewModel({
    required FetchRecipeByIdUseCase fetchRecipeByIdUseCase,
    required FetchProcedureByIdUseCase fetchProcedureByIdUseCase,
  }) : _fetchRecipeByIdUseCase = fetchRecipeByIdUseCase,
       _fetchProcedureByIdUseCase = fetchProcedureByIdUseCase;

  void onAction(IngredientAction action) {
    switch (action) {
      case ClickBackButton():
        break;
      case SwitchTab():
        _changeIndexOfTab(action.index);
      case ClickMenuButton():
        _events.add(IngredientEvent.showMenuTab());
    }
  }

  Future<void> fetchRecipeById(int id) async {
    _state = state.copyWith(
      indexOfTab: 0,
      isLoading: true,
    );
    notifyListeners();

    final Recipe selectedRecipe = await _fetchRecipeByIdUseCase.execute(id);
    final Procedure selectedProcedure = await _fetchProcedureByIdUseCase
        .execute(id);

    _state = state.copyWith(
      selectedRecipe: selectedRecipe,
      quantityOfItems: '${selectedRecipe.ingredients.length} items',
      steps: selectedProcedure.steps,
      isLoading: false,
    );
    notifyListeners();
  }

  void _changeIndexOfTab(int index) {
    _state = state.copyWith(
      indexOfTab: index,
      quantityOfItems: (state.indexOfTab == 0)
          ? '${state.selectedRecipe.ingredients.length} items'
          : '${state.steps.length} steps',
    );
    notifyListeners();
  }
}
