import 'package:flutter/cupertino.dart';

import '../../../../core/data/recipe/domain/repository/recipe_repository.dart';
import 'home_screen_state.dart';

class HomeScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  HomeScreenState _state = const HomeScreenState();

  HomeScreenState get state => _state;

  HomeScreenViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<void> fetchRecipes() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final recipes = await _recipeRepository.getRecipes();

    _state = state.copyWith(
      recipes: recipes,
      filteredRecipes: recipes,
      isLoading: false,
    );
    notifyListeners();
  }

  void changeCategory(String selectedCategory) {
    _state = state.copyWith(
      selectedCategory: selectedCategory,
    );
    notifyListeners();
  }

  Future<void> filterRecipes(String category) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    if (state.selectedCategory == 'All') {
      _state = state.copyWith(
        filteredRecipes: state.recipes,
        isLoading: false,
      );
    } else {
      final filteredRecipes = state.recipes
          .where((recipe) => recipe.category == category)
          .toList();

      _state = state.copyWith(
        filteredRecipes: filteredRecipes,
        isLoading: false,
      );
      notifyListeners();
    }
  }
}
