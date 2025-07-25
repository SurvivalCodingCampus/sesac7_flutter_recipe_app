import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/fetch_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/filter_home_recipe_category_use_case.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_action.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final FetchAllRecipesUseCase _fetchAllRecipesUseCase;
  final FilterHomeRecipeCategoryUseCase _filterHomeRecipeCategoryUseCase;

  HomeState _state = HomeState();

  HomeViewModel({
    required FetchAllRecipesUseCase fetchAllRecipesUseCase,
    required FilterHomeRecipeCategoryUseCase filterHomeRecipeCategoryUseCase,
  }) : _fetchAllRecipesUseCase = fetchAllRecipesUseCase,
       _filterHomeRecipeCategoryUseCase = filterHomeRecipeCategoryUseCase;

  HomeState get state => _state;

  void init() async {
    _loadingState();

    final result = await _fetchAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          allRecipes: result.data,
          filteredRecipes: result.data,
          isLoading: false,
          errorMessage: '',
        );

        notifyListeners();
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  void onAction(HomeAction action) {
    switch (action) {
      case SearchValueChange():
        // TODO: Handle this case.
        print(action);
      case TapFilterButton():
        // TODO: Handle this case.
        print(action);
      case SelectCategory():
        _filterHomeRecipeCategory(action.category);
      case TapFavorite():
        // TODO: Handle this case.
        print(action);
    }
  }

  void _filterHomeRecipeCategory(HomeRecipeCategory category) {
    final filteredRecipes = _filterHomeRecipeCategoryUseCase.execute(
      recipes: state.allRecipes,
      category: category,
    );
    _state = state.copyWith(
      filteredRecipes: filteredRecipes,
      selectedCategory: category,
    );

    notifyListeners();
  }

  void _loadingState() {
    _state = state.copyWith(isLoading: true);

    notifyListeners();
  }

  void _errorState(String message) {
    _state = state.copyWith(
      errorMessage: message,
      isLoading: false,
    );

    notifyListeners();
  }
}
