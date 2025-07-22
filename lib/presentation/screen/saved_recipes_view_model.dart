import 'package:flutter/cupertino.dart';

import '../../data/model/recipe.dart';
import '../../data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  bool isLoading = false;
  List<Recipe> recipes = [];

  String getRecipeName(int index) {
    final List<String> listOfName = recipes[index].name.split(' ');
    final List<String> result = [];
    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');

      result.add(firstWord);
      result.add(lastWord);
      return result.join('\n');
    }

    return '\n${recipes[index].name}';
  }

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    fetchRecipes();
  }

  void fetchRecipes() async {
    isLoading = true;
    notifyListeners();

    recipes = await _recipeRepository.getRecipes();

    isLoading = false;
    notifyListeners();
  }
}
