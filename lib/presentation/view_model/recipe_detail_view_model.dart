import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipe_detail_use_case.dart';

import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_ingrident_use_case.dart';
import '../../domain/use_case/get_procedure_use_case.dart';

class RecipeDetailViewModel with ChangeNotifier {
  Recipe? _recipe;
  Recipe? get recipe => _recipe;

  final GetIngredientsUseCase _getIngredientsUseCase;
  final GetProcedureUseCase _getProcedureUseCase;
  final GetRecipeDetailUseCase _getRecipeDetailUseCase;

  RecipeDetailViewModel({
    required GetIngredientsUseCase getIngredientsUseCase,
    required GetProcedureUseCase getProcedureUseCase,
    required GetRecipeDetailUseCase getRecipeDetailUseCase,
  }) : _getIngredientsUseCase = getIngredientsUseCase,
       _getProcedureUseCase = getProcedureUseCase,
        _getRecipeDetailUseCase = getRecipeDetailUseCase;

  void fetchIngredients(String recipeId) async {
    // _getIngredientsUseCase.getIngredients()의 데이터를 ingredients에 셋팅하고 갱신한다.
    //_recipe = _recipe.copyWith(ingredients: await _getIngredientsUseCase.getIngredients(recipeId));
    //notifyListeners();
  }

  void fetchSteps(String recipeId) async {
    // _getProcedureUseCase.getSteps()의 데이터를 steps에 셋팅하고 갱신한다.
    //_recipe = _recipe.copyWith(steps: await _getProcedureUseCase.getSteps(recipeId));
    //notifyListeners();
  }

  void fetchRecipeDetail(String recipeId) async {
    _recipe = await _getRecipeDetailUseCase.getRecipe(recipeId);
    notifyListeners();
  }
}
