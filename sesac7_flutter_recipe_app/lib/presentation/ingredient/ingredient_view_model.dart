import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel extends ValueNotifier<IngredientState> {
  final GetSavedRecipeFindByIdUseCase _getSavedRecipeFindByIdUseCase;
  final GetProceduresByRecipeIdUseCase _getProceduresByRecipeIdUseCase;

  IngredientViewModel({
    required GetSavedRecipeFindByIdUseCase getSavedRecipeFindByIdUseCase,
    required GetProceduresByRecipeIdUseCase getProceduresByRecipeIdUseCase,
  }) : _getSavedRecipeFindByIdUseCase = getSavedRecipeFindByIdUseCase,
       _getProceduresByRecipeIdUseCase = getProceduresByRecipeIdUseCase,
       super(IngredientState());

  void onAction(IngredientAction action) {
    switch (action) {
      case ClickIngredientBackButton():
        break;
      case ChangeIngredientTapSelectedIndex():
        changeTab(action.index);
      case ClickPopupMenuItem():
        break;
    }
  }

  Future<void> fetchCurrentSelectedRecipe(int id) async {
    final Result<Recipe?, String> result = await _getSavedRecipeFindByIdUseCase
        .execute(id);
    switch (result) {
      case Success<Recipe?, String>():
        value = value.copyWith(
          currentSelectedRecipe: result.data,
        );
      case Error<Recipe?, String>():
        value = value.copyWith(
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
        value = value.copyWith(
          currentSelectedRecipeProcedures: result.data,
        );
      case Error<List<Procedure>, NetworkError>():
        value = value.copyWith(
          currentSelectedRecipeProcedures: [],
        );
    }
    notifyListeners();
  }

  void changeTab(int index) {
    value = value.copyWith(selectedLabelIndex: index);
    notifyListeners();
  }
}
