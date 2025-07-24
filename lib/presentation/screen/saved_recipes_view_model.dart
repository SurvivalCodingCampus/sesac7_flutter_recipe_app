import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/data/repository/bookmark_repository.dart';

import '../../data/model/recipe.dart';
import '../../data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  bool isLoading = false;
  List<Recipe> recipes = [];

  SavedRecipesViewModel({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository {
    fetchRecipes();
  }

  void fetchRecipes() async {
    isLoading = true;
    notifyListeners();

    recipes = await _bookmarkRepository.getSavedRecipes();

    isLoading = false;
    notifyListeners();
  }

  void deleteRecipe(int id) async {
    recipes.removeWhere((recipe) => recipe.id == id);
    notifyListeners();
  }
}
