import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_screen_state.dart';

import '../../../../core/data/recipe/domain/repository/recipe_repository.dart';
import '../../../../data/bookmark/domain/repository/bookmark_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  SavedRecipesScreenState _state = const SavedRecipesScreenState();

  SavedRecipesScreenState get state => _state;

  SavedRecipesViewModel({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository {
    fetchRecipes();
  }

  void fetchRecipes() async {
    _state = state.copyWith(
      isLoading: true,
    );

    notifyListeners();

    final recipes = await _bookmarkRepository.getSavedRecipes();

    _state = state.copyWith(
      recipes: recipes,
      isLoading: false,
    );
    notifyListeners();
  }

  void deleteRecipe(int id) async {
    final recipes = state.recipes.where((recipe) => recipe.id != id).toList();
    _state = state.copyWith(
      recipes: recipes,
    );
    notifyListeners();
  }
}
