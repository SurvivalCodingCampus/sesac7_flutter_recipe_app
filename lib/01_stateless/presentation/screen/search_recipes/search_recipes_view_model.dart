import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';

import '../../../data/model/recipe.dart';
import '../../../data/repository/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
          originalRecipes: result.data,
          filteredRecipes: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<Recipe>>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  void search(String query) {
    final filteredRecipes = state.originalRecipes
        .where(
          (e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              e.chef.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    _state = state.copyWith(
      query: query,
      searchLabel: state.originalRecipes.length == filteredRecipes.length
          ? 'Recent Search'
          : 'Search Result',
      filteredRecipes: filteredRecipes,
      resultLabel: query.isEmpty ? '' : '${filteredRecipes.length} results',
    );
    notifyListeners();
  }
}
