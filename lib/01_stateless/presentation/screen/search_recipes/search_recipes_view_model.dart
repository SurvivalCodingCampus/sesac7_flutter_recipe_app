import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/bottom_sheet/bottom_sheet_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/filter_recipes_by_keyword_use_case.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final FilterRecipesByKeywordUseCase _filterRecipesByKeywordUseCase;

  SearchRecipesViewModel({
    required FilterRecipesByKeywordUseCase filterRecipesByKeywordUseCase,
  }) : _filterRecipesByKeywordUseCase = filterRecipesByKeywordUseCase;

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  void getAllRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _filterRecipesByKeywordUseCase.execute('', {}, 0),
      isLoading: false,
    );
    notifyListeners();
  }

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case TypeOnTextField():
        _updateInput(action.text);
        _applyFilter();
      case BringBottomSheet():
        break;
      case ClickOnRecipe():
        break;
      case ClickOnBackspace():
        break;
    }
  }

  void onBottomSheetAction(BottomSheetAction action) {
    switch (action) {
      case ClickOnFilter():
        _applyFilter();
        break;
      case SelectTime():
        break;
      case SelectRate():
        if(action.rate == state.rate) {
          break;
        }
        else {
          _updateRate(action.rate);
        }
      case SelectCategory():
        if(action.category == 'All') {
          if (state.categories.isEmpty) {
            break;
          }
          else {
            _updateCategory({});
            break;
          }
        }
        else {
          if (state.categories.contains(action.category)) {
            Set<String> newCategories = Set.from(state.categories);
            newCategories.remove(action.category);
            _updateCategory(newCategories);
          }
          else {
            Set<String> newCategories = Set.from(state.categories);
            newCategories.add(action.category);
            _updateCategory(newCategories);
          }
        }
    }
  }

  void _updateInput(String input) {
    _state = state.copyWith(input : input);
    notifyListeners();
  }

  void _updateRate(int rate) {

    _state = state.copyWith(rate: rate);
    notifyListeners();
  }

  void _updateCategory(Set<String> categories) {
    _state = state.copyWith(categories: categories);
    notifyListeners();
  }

  void _applyFilter() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _filterRecipesByKeywordUseCase.execute(state.input, state.categories, state.rate),
      isLoading: false,
    );
    notifyListeners();
  }

}