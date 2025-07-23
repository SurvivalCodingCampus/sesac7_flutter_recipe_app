import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipes_repository.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe.dart';
import 'package:flutter_recipe_app/saved_recipes/domain/use_case/fetch_recipes_use_case.dart';
import 'package:flutter_recipe_app/saved_recipes/presentation/saved_recipes_state.dart';

import '../../core/network_error.dart';
import '../domain/use_case/unsaved_recipe_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  // final RecipeRepository _repository;
  final FetchRecipesUseCase _fetchRecipesUseCase;
  SavedRecipesState _state = SavedRecipesState();
  SavedRecipesState get state => _state;
  final UnsavedRecipeUseCase _unsaveRecipeUseCase;

  // final Set<int> bookmarkedIds = {};
  // state로 이동

  SavedRecipesViewModel({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required UnsavedRecipeUseCase unsaveRecipeUseCase,
  })  : _fetchRecipesUseCase = fetchRecipesUseCase,
        _unsaveRecipeUseCase = unsaveRecipeUseCase;

  // repository 가 여러개 들어올 수 있어서 named constructor로 작성하는것이 좋다

  // final List<Recipe> _recipes = [];
  // List<Recipe> get recipes => List.unmodifiable(_recipes);
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  Future<void> fetchRecipes() async {
    // _isLoading = true;
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _fetchRecipesUseCase.execute();

    switch (result) {
      case Success<SavedRecipesState, NetworkError>():
        _state = result.value;
        notifyListeners();
        break;
      case Failure<SavedRecipesState, NetworkError>():
        print('Error fetching recipes: $NetworkError');
        _state = _state.copyWith(isLoading: false);
        break;
    }

    // try {
    //   await Future.delayed(const Duration(seconds: 2));
    //   final fetchedRecipes = await _repository.fetchRecipes();
    //   // _recipes = fetchedRecipes;
    //   fetchedRecipes.when(
    //     success: (data) {
    //       _recipes = data;
    //     },
    //     failure: (error) {
    //       print('Error fetching recipes: $error');
    //     },
    //   );
    // } catch (e) {
    //   print('Error fetching recipes: $e');
    // }

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void unsave(int recipeId) {
    _state = _unsaveRecipeUseCase.execute(_state, recipeId);
    notifyListeners();
  }

  List<Recipe> get bookmarkedRecipes {
    return _state.recipes
      .where((recipe) => _state.bookmarkedIds.contains(recipe.id))
      .toList();
  }


}