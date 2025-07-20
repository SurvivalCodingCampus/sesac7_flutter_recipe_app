import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/category.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_state.dart';

class SearchRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipeViewModel(this._recipeRepository);

  SearchRecipeState _state = SearchRecipeState();

  SearchRecipeState get state => _state;

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final response = await _recipeRepository.getRecipes();

    switch (response) {
      case Success<List<Recipe>, NetworkError>():
        _state = _state.copyWith(recipes: response.data);
        break;
      case Error<List<Recipe>, NetworkError>():
        _state = _state.copyWith(recipes: []);
        break;
    }
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> fetchCategory() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final response = await _recipeRepository.getCategory();
    switch (response) {
      case Success<List<Category>, NetworkError>():
        _state = _state.copyWith(categories: response.data);
        break;
      case Error<List<Category>, NetworkError>():
        _state = _state.copyWith(categories: []);
        break;
    }

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void updateKeyword(String newKeyword) {
    _state = _state.copyWith(keyword: newKeyword);
    notifyListeners();
  }

  void updateRating(int newRating) {
    final int? oldRating = _state.rating;
    _state = _state.copyWith(rating: oldRating == newRating ? null : newRating);
    notifyListeners();
  }

  Future<void> filterRecipes({
    String? keyword,
    List<String>? category,
    List<String>? time,
    List<String>? rating,
  }) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final String inputKeyword = keyword ?? _state.keyword;
    final int? selectedRatingFilter = _state.rating;

    final bool noFiltersApplied =
        inputKeyword.isEmpty &&
        (category == null || category.isEmpty) &&
        (time == null || time.isEmpty) &&
        selectedRatingFilter == null;

    switch (noFiltersApplied) {
      case true:
        await fetchRecipes();
        await fetchCategory();
        break;
      case false:
        List<Recipe> filteredRecipes =
            _state.recipes;

        if (inputKeyword.isNotEmpty) {
          final String lowerCaseKeyword = inputKeyword.toLowerCase();
          filteredRecipes = filteredRecipes.where((recipe) {
            return recipe.name.toLowerCase().contains(lowerCaseKeyword) ||
                recipe.chef.toLowerCase().contains(lowerCaseKeyword);
          }).toList();
        }

        if (selectedRatingFilter != null) {
          filteredRecipes = filteredRecipes.where((recipe) {
            return recipe.rating >= selectedRatingFilter;
          }).toList();
        }

        _state = _state.copyWith(recipes: filteredRecipes, isLoading: false);
        notifyListeners();
        break;
    }
  }
}
