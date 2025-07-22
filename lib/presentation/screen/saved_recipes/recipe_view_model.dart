import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/repository/recipes_repository.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';

class RecipeCardViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  final Set<int> bookmarkedIds = {}; // 북마크 상태 저장

  RecipeCardViewModel({required RecipeRepository repository}) : _repository = repository;
  // repository 가 여러개 들어올 수 있어서 named constructor로 작성하는것이 좋다

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      final fetchedRecipes = await _repository.fetchRecipes();
      // _recipes = fetchedRecipes;
      fetchedRecipes.when(
        success: (data) {
          _recipes = data;
        },
        failure: (error) {
          print('Error fetching recipes: $error');
        },
      );
    } catch (e) {
      print('Error fetching recipes: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleBookmark(int recipeId) {
    if (bookmarkedIds.contains(recipeId)) {
      bookmarkedIds.remove(recipeId);
    } else {
      bookmarkedIds.add(recipeId);
    }
    notifyListeners();
  }
}