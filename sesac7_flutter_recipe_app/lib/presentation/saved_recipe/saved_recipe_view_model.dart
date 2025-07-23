import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_state.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  SavedRecipeState _savedRecipeState = SavedRecipeState();

  SavedRecipeState get savedRecipeState => _savedRecipeState;

  SavedRecipeViewModel(RecipeRepository recipeRepository)
    : _recipeRepository = recipeRepository;

  Future<void> fetchRecipes() async {
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .getRecipes();
    switch (result) {
      case Success():
        _savedRecipeState = _savedRecipeState.copyWith(recipes: result.data);
        break;
      case Error():
        _savedRecipeState = _savedRecipeState.copyWith(recipes: []);
        break;
    }
    notifyListeners();
  }
}
