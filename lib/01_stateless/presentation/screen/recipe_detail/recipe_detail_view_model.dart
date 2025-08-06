import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_state.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/bookmark_recipe_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipe_detail_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/is_bookmarked_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/unbookmark_recipe_by_id_use_case.dart';

import 'recipe_detail_action.dart';

class RecipeDetailViewModel with ChangeNotifier {
  final GetRecipeDetailByIdUseCase _getRecipeDetailByIdUseCase;
  final BookmarkRecipeByIdUseCase _bookmarkRecipeByIdUseCase;
  final UnbookmarkRecipeByIdUseCase _unbookmarkRecipeByIdUseCase;
  final IsBookmarkedByIdUseCase _isBookmarkedByIdUseCase;

  RecipeDetailViewModel({
    required GetRecipeDetailByIdUseCase getRecipeDetailByIdUseCase,
    required BookmarkRecipeByIdUseCase bookmarkRecipeByIdUseCase,
    required UnbookmarkRecipeByIdUseCase unBookmarkRecipeByIdUseCase,
    required IsBookmarkedByIdUseCase isBookmarkedByIdUseCase,
  }) : _getRecipeDetailByIdUseCase = getRecipeDetailByIdUseCase,
       _bookmarkRecipeByIdUseCase = bookmarkRecipeByIdUseCase,
       _unbookmarkRecipeByIdUseCase = unBookmarkRecipeByIdUseCase,
       _isBookmarkedByIdUseCase = isBookmarkedByIdUseCase;

  RecipeDetailState _state = const RecipeDetailState();

  RecipeDetailState get state => _state;

  void getRecipeDetailData(int id) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      currentRecipe: await _getRecipeDetailByIdUseCase.execute(id),
      isLoading: false,
    );
    notifyListeners();
  }

  void onAction(RecipeDetailAction action) {
    switch (action) {
      case ClickOnBookmark():
        _toggleBookmark(state.currentRecipe.id);
        break;
      case ClickOnShare():
        break;
      case ClickOnReview():
        break;
      case ClickOnRate():
        break;
    }
  }

  void _toggleBookmark(int recipeId) async {
    bool isBookmarked = await _isBookmarkedByIdUseCase.execute(recipeId);

    if (isBookmarked) {
      final result = await _unbookmarkRecipeByIdUseCase.execute(recipeId);
      if (result) {
        getRecipeDetailData(recipeId);
      }
    } else {
      final result = await _bookmarkRecipeByIdUseCase.execute(recipeId);
      if (result) {
        getRecipeDetailData(recipeId);
      }
    }
  }
}
