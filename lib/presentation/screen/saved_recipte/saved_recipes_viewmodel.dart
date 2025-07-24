import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/model/user.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/use_case/get_users_use_case.dart';
import 'package:flutter_recipe_app/domain/use_case/toggle_bookmark_use_case.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/saved_recipes_state.dart';

class SavedRecipesViewModel extends ChangeNotifier {
  final GetUsersUseCase _getUsersUseCase;
  final GetRecipesUseCase _getRecipesUseCase;
  final ToggleBookmarkUseCase _toggleBookmarkUseCase;

  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({
    required GetUsersUseCase getUsersUseCase,
    required GetRecipesUseCase getRecipesUseCase,
    required ToggleBookmarkUseCase toggleBookmarkUseCase,
  }) : _getUsersUseCase = getUsersUseCase,
       _getRecipesUseCase = getRecipesUseCase,
       _toggleBookmarkUseCase = toggleBookmarkUseCase {
    fetchData();
  }

  Future<void> fetchData() async {
    final users = await _getUsersUseCase();
    final recipes = await _getRecipesUseCase();
    final initialRecipes = recipes
        .map((r) => r.copyWith(isBookmarked: true))
        .toList();

    _state = _state.copyWith(
      users: users,
      recipes: initialRecipes,
    );
    notifyListeners();
  }

  List<Recipe> getSavedRecipes() {
    return _state.recipes.where((recipe) => recipe.isBookmarked).toList();
  }

  User getUserById(String userId) {
    return _state.users.firstWhere(
      (u) => u.id == userId,
      orElse: () => _state.users.first,
    );
  }

  void toggleBookmark(String recipeId) {
    final newRecipes = _toggleBookmarkUseCase(_state.recipes, recipeId);
    _state = _state.copyWith(recipes: newRecipes);
    notifyListeners();
  }
}
