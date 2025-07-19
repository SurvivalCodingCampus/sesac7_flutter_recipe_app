
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
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

    switch (response){
      case Success<List<Recipe>, NetworkError>() :
        _state = _state.copyWith(recipes: response.data);
        break;
      case Error<List<Recipe>, NetworkError>() :
        _state = _state.copyWith(recipes: []);
        break;
    }
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

}