import 'package:flutter/material.dart';

import '../../../data/repository/recipe_repository.dart';

class SavedRecipesScreen with ChangeNotifier {
  RecipeRepository _recipeRepository;

  SavedRecipesScreen({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;


}
