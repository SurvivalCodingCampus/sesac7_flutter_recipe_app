import 'package:flutter/foundation.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';

class RecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  RecipeViewModel(this._recipeRepository);

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final response = await _recipeRepository.getRecipes();

    response.when(
      success: (recipeList) {
        _recipes = recipeList;
        _isLoading = false;
      },
      error: (error) {
        _recipes = [];
        _isLoading = false;
      },
    );
    notifyListeners();
  }

}