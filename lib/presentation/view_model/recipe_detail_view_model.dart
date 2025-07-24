import 'package:flutter/material.dart';

import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_ingrident_use_case.dart';
import '../../domain/use_case/get_procedure_use_case.dart';

class RecipeDetailViewModel with ChangeNotifier {
  // List<RecipeIngredient> ingredients;
  // List<StepInfo> steps;
  Recipe _recipe;
  get recipe => _recipe;

  final GetIngredientsUseCase _getIngredientsUseCase;
  final GetProcedureUseCase _getProcedureUseCase;

  RecipeDetailViewModel({
    required GetIngredientsUseCase getIngredientsUseCase,
    required GetProcedureUseCase getProcedureUseCase,
    required Recipe recipe,
  }) : _getIngredientsUseCase = getIngredientsUseCase,
       _getProcedureUseCase = getProcedureUseCase,
        _recipe = recipe;

  void fetchIngredients() {
    // _getIngredientsUseCase.getIngredients()의 데이터를 ingredients에 셋팅하고 갱신한다.
    _recipe = _recipe.copyWith(ingredients: _getIngredientsUseCase.getIngredients());
    notifyListeners();
  }

  void fetchSteps() {
    // _getProcedureUseCase.getSteps()의 데이터를 steps에 셋팅하고 갱신한다.
    _recipe = _recipe.copyWith(steps: _getProcedureUseCase.getSteps());
    notifyListeners();
  }
}
