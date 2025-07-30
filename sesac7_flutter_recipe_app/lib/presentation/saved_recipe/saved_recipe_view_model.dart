import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_action.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_state.dart';

class SavedRecipeViewModel extends ValueNotifier<SavedRecipeState> {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveSavedRecipeUseCase _removeSavedRecipeUseCase;
  final GetBookmarkChangedStreamUseCase _getBookmarkChangedStreamUseCase;

  Stream<void> get bookmarkChangedStream =>
      _getBookmarkChangedStreamUseCase.execute();

  SavedRecipeViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required RemoveSavedRecipeUseCase removeSavedRecipeUseCase,
    required GetBookmarkChangedStreamUseCase getBookmarkChangedStreamUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _removeSavedRecipeUseCase = removeSavedRecipeUseCase,
       _getBookmarkChangedStreamUseCase = getBookmarkChangedStreamUseCase,
       super(SavedRecipeState());

  void onAction(SavedRecipeAction action) {
    switch (action) {
      case MoveSavedRecipeIngredientScreen():
        break;
      case RemoveSavedRecipe():
        _removeSavedRecipe(action.id);
    }
  }

  Future<void> fetchSavedRecipes() async {
    final Result<List<Recipe>, String> result = await _getSavedRecipesUseCase
        .execute();
    switch (result) {
      case Success():
        value = value.copyWith(
          savedRecipes: result.data,
        );
      case Error():
        value = value.copyWith(savedRecipes: []);
    }
    notifyListeners();
  }

  Future<void> _removeSavedRecipe(int id) async {
    final Result<void, String> result = await _removeSavedRecipeUseCase.execute(
      id,
    );
    switch (result) {
      case Success():
        fetchSavedRecipes();
        value = value.copyWith(
          savedRecipes: value.savedRecipes
              .where((recipe) => recipe.id != id)
              .toList(),
        );
        notifyListeners();
      case Error():
        break;
    }
  }
}
