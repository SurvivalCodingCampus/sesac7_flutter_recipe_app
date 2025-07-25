import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_state.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/bookmark_recipe_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_bookmarked_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/unbookmark_recipe_by_id_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetBookmarkedRecipesUseCase _getBookmarkedRecipesUseCase;
  final BookmarkRecipeByIdUseCase _bookmarkRecipeByIdUseCase;
  final UnbookmarkRecipeByIdUseCase _unbookmarkRecipeByIdUseCase;

  SavedRecipesViewModel({
    required GetBookmarkedRecipesUseCase getBookmarkedRecipesUseCase,
    required BookmarkRecipeByIdUseCase bookmarkRecipeByIdUseCase,
    required UnbookmarkRecipeByIdUseCase unbookmarkRecipeByIdUseCase,
  }) : _getBookmarkedRecipesUseCase = getBookmarkedRecipesUseCase,
       _bookmarkRecipeByIdUseCase = bookmarkRecipeByIdUseCase,
       _unbookmarkRecipeByIdUseCase = unbookmarkRecipeByIdUseCase;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;


  Future<void> fetchBookmarkedRecipeData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _getBookmarkedRecipesUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }

  //TODO but not really functional
  Future<void> _addBookmarkedRecipe(int id) async {
    return;
  }

  Future<void> _removeBookmarkedRecipe(int id) async {
    final result = await _unbookmarkRecipeByIdUseCase.execute(id);
    if (result) {
      fetchBookmarkedRecipeData();
    } else {
      print('Failed to remove bookmark?');
    }
  }

  void onAction(SavedRecipesAction action) {
    switch (action) {
      case ClickOnRecipe():
        break;
      case ClickOnBookmark():
        _removeBookmarkedRecipe(action.recipeId);
        break;
    }
  }
}
