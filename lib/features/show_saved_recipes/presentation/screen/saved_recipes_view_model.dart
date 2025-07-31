import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/data/domain/use_case/delete_bookmarked_recipe_use_case.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_action.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_screen_state.dart';

import '../../data/domain/use_case/get_saved_recipes_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final DeleteBookmarkedRecipeUseCase _deleteBookmarkedRecipeUseCase;

  SavedRecipesScreenState _state = const SavedRecipesScreenState();

  SavedRecipesScreenState get state => _state;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required DeleteBookmarkedRecipeUseCase deleteBookmarkedRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _deleteBookmarkedRecipeUseCase = deleteBookmarkedRecipeUseCase;

  void onAction(SavedRecipesAction action) {
    switch (action) {
      case ClickRecipeCard():
        break;
      case ClickBookmarkButton():
        _deleteRecipe(action.id);
    }
  }

  void fetchRecipes() {
    _state = state.copyWith(
      isLoading: true,
    );

    notifyListeners();

    final recipes = _getSavedRecipesUseCase.execute();

    _state = state.copyWith(
      recipes: recipes ?? [],
      isLoading: false,
    );
    notifyListeners();
  }

  void _deleteRecipe(int id) async {
    _deleteBookmarkedRecipeUseCase.execute(id);

    _state = state.copyWith(
      recipes: _getSavedRecipesUseCase.execute() ?? [],
    );
    notifyListeners();
  }
}
