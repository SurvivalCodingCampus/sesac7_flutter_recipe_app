import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_state.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipes_by_category_use_case.dart';

class MainViewModel with ChangeNotifier {
  final GetRecipeByCategoryUseCase _getRecipeByCategoryUseCase;

  MainViewModel({
    required GetRecipeByCategoryUseCase getRecipeByCategoryUseCase,
  }) : _getRecipeByCategoryUseCase = getRecipeByCategoryUseCase;

  MainState _state = const MainState();

  MainState get state => _state;
  
  Future<void> fetchRecipeData() async {
    _state = state.copyWith(isLoading: true);

    notifyListeners();

    _state = state.copyWith(
      currentRecipes: await _getRecipeByCategoryUseCase.execute(state.tabs[state.tabIndex]),
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
        _setBookMarkOn(action.recipeId);
    }
  }

  void _setTabTo(int index) {
    if(index == state.tabIndex) {
      return;
    }
    _state = state.copyWith(
      tabIndex: index,
    );
    fetchRecipeData();
  }

  void _setBookMarkOn(int recipeId) {
    //not yet
    return;
  }
}