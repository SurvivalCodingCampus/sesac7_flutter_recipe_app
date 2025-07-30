import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_action.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_screen_state.dart';

import '../../../../data/bookmark/domain/repository/mock_bookmark_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final MockBookmarkRepository _bookmarkRepository;

  SavedRecipesScreenState _state = const SavedRecipesScreenState();

  SavedRecipesScreenState get state => _state;

  SavedRecipesViewModel({
    required MockBookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

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

    final recipes = _bookmarkRepository.getAllRecipes();

    _state = state.copyWith(
      recipes: recipes,
      isLoading: false,
    );
    notifyListeners();
  }

  void _deleteRecipe(int id) async {
    _bookmarkRepository.deleteRecipe(id);

    _state = state.copyWith(
      recipes: _bookmarkRepository.getSavedRecipes(),
    );
    notifyListeners();
  }
}
