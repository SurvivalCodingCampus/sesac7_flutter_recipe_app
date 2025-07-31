import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/presentation/screen/search_screen/search_recipes_state.dart';

import '../../../core/routing/result.dart';
import '../../../data/repository/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  // 修正：saved_recipes_view_model.dartと同じロジックを使っている
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  final SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  // 修正：同じロジックを使っている
  void fetchSearchRecipes() async {
    state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success(data: final result):
        state.copyWith(filteredRecipes: result);
      case Error(error: final error):
        state.copyWith(filteredRecipes: []);
        state.copyWith(errorMessage: error.toString());
    }
    state.copyWith(isLoading: false);

    notifyListeners();
  }

  void searchRecipes(String query) {
    state.copyWith(searchQuery: query);
    notifyListeners();
    // 찾기
    final filteredRecipes = state.originalRecipes.where((recipe) {
      return recipe.name.toLowerCase().contains(query.toLowerCase()) ||
          recipe.chef.toLowerCase().contains(query.toLowerCase());
    }).toList();

    state.copyWith(
      searchQuery: query,
      searchLabel: state.originalRecipes.length == filteredRecipes.length
          ? 'Recent Search'
          : 'Search Results',
      filteredRecipes: filteredRecipes,
      resultLabel: filteredRecipes.isEmpty
          ? 'No results found'
          : '${filteredRecipes.length} results',
    );
    notifyListeners();
  }
}
