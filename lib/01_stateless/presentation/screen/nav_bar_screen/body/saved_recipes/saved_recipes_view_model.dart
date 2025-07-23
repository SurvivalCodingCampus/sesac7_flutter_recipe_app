import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/bookmark_recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  BookmarkRecipeRepository _repo;

  SavedRecipesViewModel({
    required BookmarkRecipeRepository repo,
  }) : _repo = repo;


  set repo(BookmarkRecipeRepository s) {
    _repo = s;
  }

  List<Recipe> _recipes = [];
  bool _isLoading = false;

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);
  bool get isLoading => _isLoading;

  Future<void> fetchBookmarkedRecipeData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _repo.getBookmarkedRecipes();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addBookmarkedRecipe() async {
    //TODO
    return;
  }

  Future<void> removeBookmarkedRecipe(int index) async {
    final result = await _repo.removeBookmarkRecipe(index);
    if (result) {
      fetchBookmarkedRecipeData();
    }
    else {
      print('Failed to remove bookmark?');
    }
  }



}