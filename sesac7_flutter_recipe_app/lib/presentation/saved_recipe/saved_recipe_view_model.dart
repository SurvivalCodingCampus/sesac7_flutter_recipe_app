import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository/recipe_repository.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  SavedRecipeViewModel(RecipeRepository recipeRepository)
    : _recipeRepository = recipeRepository;

  Future<void> fetchRecipes() async {
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository.getRecipes();
    switch (result) {
      case Success():
        _recipes = result.data;
        break;
      case Error():
        _recipes = [];
        // todo 에러 처리
        break;
    }
    notifyListeners();
  }
}
