import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel extends ChangeNotifier {
  final GetSavedRecipeFindByIdUseCase _getSavedRecipeFindByIdUseCase;
  final GetProceduresByRecipeIdUseCase _getProceduresByRecipeIdUseCase;

  IngredientState _ingredientState = IngredientState();

  IngredientState get ingredientState => _ingredientState;

  IngredientViewModel({
    required GetSavedRecipeFindByIdUseCase getSavedRecipeFindByIdUseCase,
    required GetProceduresByRecipeIdUseCase getProceduresByRecipeIdUseCase,
  }) : _getSavedRecipeFindByIdUseCase = getSavedRecipeFindByIdUseCase,
       _getProceduresByRecipeIdUseCase = getProceduresByRecipeIdUseCase;

  Future<void> fetchCurrentSelectedRecipe(int id) async {
    final Result<Recipe?, String> result = await _getSavedRecipeFindByIdUseCase
        .execute(id);
    switch (result) {
      case Success<Recipe?, String>():
        _ingredientState = _ingredientState.copyWith(
          currentSelectedRecipe: result.data,
        );
      case Error<Recipe?, String>():
        _ingredientState = _ingredientState.copyWith(
          currentSelectedRecipe: null,
        );
    }
    notifyListeners();
  }

  Future<void> fetchCurrentSelectedRecipeProcedures(int id) async {
    final Result<List<Procedure>, NetworkError> result =
        await _getProceduresByRecipeIdUseCase.execute(id);
    switch (result) {
      case Success<List<Procedure>, NetworkError>():
        _ingredientState = _ingredientState.copyWith(
          currentSelectedRecipeProcedures: result.data,
        );
      case Error<List<Procedure>, NetworkError>():
        _ingredientState = _ingredientState.copyWith(
          currentSelectedRecipeProcedures: [],
        );
    }
    notifyListeners();
  }

  void changeTab(int index) {
    _ingredientState = _ingredientState.copyWith(selectedLabelIndex: index);
    notifyListeners();
  }
}
