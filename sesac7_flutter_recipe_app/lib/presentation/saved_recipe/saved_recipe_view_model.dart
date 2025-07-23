import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_state.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveSavedRecipeUseCase _removeSavedRecipeUseCase;

  SavedRecipeState _savedRecipeState = SavedRecipeState();

  SavedRecipeState get savedRecipeState => _savedRecipeState;

  SavedRecipeViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required RemoveSavedRecipeUseCase removeSavedRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _removeSavedRecipeUseCase = removeSavedRecipeUseCase;

  Future<void> fetchSavedRecipes() async {
    final Result<List<Recipe>, String> result = await _getSavedRecipesUseCase
        .execute();
    switch (result) {
      case Success():
        _savedRecipeState = _savedRecipeState.copyWith(
          savedRecipes: result.data,
        );
        notifyListeners();
        break;
      case Error():
        _savedRecipeState = _savedRecipeState.copyWith(savedRecipes: []);
        break;
    }
    notifyListeners();
  }

  Future<void> removeSavedRecipe(int id) async {
    final Result<void, String> result = await _removeSavedRecipeUseCase.execute(
      id,
    );
    switch (result) {
      case Success():
        // fetchSavedRecipes();
        _savedRecipeState = _savedRecipeState.copyWith(
          savedRecipes: _savedRecipeState.savedRecipes
              .where((recipe) => recipe.id != id)
              .toList(),
        );
        notifyListeners();
        break;
      case Error():
        break;
    }
  }
}
