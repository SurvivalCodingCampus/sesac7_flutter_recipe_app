import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_state.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/bookmark_recipe_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipes_by_category_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/is_bookmarked_by_id_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/unbookmark_recipe_by_id_use_case.dart';

class MainViewModel with ChangeNotifier {
  final GetRecipeByCategoryUseCase _getRecipeByCategoryUseCase;
  final BookmarkRecipeByIdUseCase _bookmarkRecipeByIdUseCase;
  final UnbookmarkRecipeByIdUseCase _unbookmarkRecipeByIdUseCase;
  final IsBookmarkedByIdUseCase _isBookmarkedByIdUseCase;

  MainViewModel({
    required GetRecipeByCategoryUseCase getRecipeByCategoryUseCase,
    required BookmarkRecipeByIdUseCase bookmarkRecipeByIdUseCase,
    required UnbookmarkRecipeByIdUseCase unBookmarkRecipeByIdUseCase,
    required IsBookmarkedByIdUseCase isBookmarkedByIdUseCase,
  }) : _getRecipeByCategoryUseCase = getRecipeByCategoryUseCase,
       _bookmarkRecipeByIdUseCase = bookmarkRecipeByIdUseCase,
       _unbookmarkRecipeByIdUseCase = unBookmarkRecipeByIdUseCase,
       _isBookmarkedByIdUseCase = isBookmarkedByIdUseCase;

  MainState _state = const MainState();

  MainState get state => _state;

  Future<void> fetchRecipeData() async {
    _state = state.copyWith(isLoading: true);

    notifyListeners();

    _state = state.copyWith(
      currentRecipes: await _getRecipeByCategoryUseCase.execute(
        state.tabs[state.tabIndex],
      ),
      isLoading: false,
    );
    notifyListeners();
  }

  void onAction(MainAction action) {
    switch (action) {
      case ClickCategoryTab():
        _setTabTo(action.index);
        break;
      case ClickOnRecipe():
        break;
      case ClickOnBookmark():
        _toggleBookmark(action.recipeId);
      case ClickOnSearch():
        break;
    }
  }

  void _setTabTo(int index) {
    if (index == state.tabIndex) {
      return;
    }
    _state = state.copyWith(
      tabIndex: index,
    );
    fetchRecipeData();
  }

  void _toggleBookmark(int recipeId) async {
    bool isBookmarked = await _isBookmarkedByIdUseCase.execute(recipeId);

    if(isBookmarked) {
      final result = await _unbookmarkRecipeByIdUseCase.execute(recipeId);
      if (result) {
        fetchRecipeData();
      }
    }
    else {
      final result = await _bookmarkRecipeByIdUseCase.execute(recipeId);
      if (result) {
        fetchRecipeData();
      }
    }
  }
}
