import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel extends ChangeNotifier {
  final GetSavedRecipeFindByIdUseCase _getSavedRecipeFindByIdUseCase;

  IngredientState _ingredientState = IngredientState();

  IngredientState get ingredientState => _ingredientState;

  IngredientViewModel({
    required GetSavedRecipeFindByIdUseCase getSavedRecipeFindByIdUseCase,
  }) : _getSavedRecipeFindByIdUseCase = getSavedRecipeFindByIdUseCase;

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

  void changeTab(int index) {
    _ingredientState = _ingredientState.copyWith(selectedLabelIndex: index);
    notifyListeners();
  }
}
