import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/ingredient/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final GetRecipeUseCase _getRecipeUseCase;

  IngredientState _state = const IngredientState();

  IngredientState get state => _state;

  IngredientViewModel({
    required GetRecipeUseCase getRecipeUseCase,
  }) : _getRecipeUseCase = getRecipeUseCase;

  void fetchRecipe(int id) async {
    final result = await _getRecipeUseCase.execute(id);
    switch (result) {
      case Success<Recipe>():
        _state = state.copyWith(recipe: result.data);
        notifyListeners();
      case Error<Recipe>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
