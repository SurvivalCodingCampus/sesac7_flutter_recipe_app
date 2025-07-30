import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_action.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_event.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_state.dart';

import '../../core/domain/model/recipe.dart';
import '../../core/domain/repository/recipes_repository.dart';
import '../domain/model/recipe_menu_item.dart';
import '../domain/use_case/fetch_recipe_use_case.dart';

class RecipeIngredientsViewModel with ChangeNotifier{
  final int recipeId;
  final FetchRecipeIngredientsUseCase _fetchRecipeUseCase;
  final RecipeRepository _recipeRepository;

  RecipeIngredientsState _state = RecipeIngredientsState();
  RecipeIngredientsState get state => _state;

  final _eventController = StreamController<RecipeIngredientsScreenEvent>.broadcast();
  Stream<RecipeIngredientsScreenEvent> get eventStream => _eventController.stream;

  RecipeIngredientsViewModel({
    required this.recipeId,
    required FetchRecipeIngredientsUseCase fetchRecipeUseCase,
    required RecipeRepository recipeRepository,
  })  : _fetchRecipeUseCase = fetchRecipeUseCase,
        _recipeRepository = recipeRepository;

  void onAction(RecipeIngredientsAction action) {
    switch (action) {
      case MenuItemSelected(item: RecipeMenuItem.rate):
        // print('rate 선택됨');
        _handleMenuItemSelected(RecipeMenuItem.rate);
        break;
      case MenuItemSelected(item: RecipeMenuItem.review):
        // TODO: Handle this case.
        throw UnimplementedError();
      case MenuItemSelected(item: RecipeMenuItem.unsave):
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  void _handleMenuItemSelected(RecipeMenuItem item) {
    switch (item) {
      case RecipeMenuItem.rate:
        _eventController.add(const RecipeIngredientsScreenEvent.showRatingDialog());
        break;
      case RecipeMenuItem.review:
        break;
      case RecipeMenuItem.unsave:
        break;
    }
  }

  Future<void> fetchRecipeIngredients() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _fetchRecipeUseCase.execute(recipeId);
    final recipeResult = await _recipeRepository.fetchRecipeById(recipeId);
    Recipe? recipe;

    // print('레시피 아이디: $recipeId');
    // print('레시피 결과: $recipeResult');

    recipeResult.when (
      success: (fetchedRecipe) {
        recipe = fetchedRecipe;
      },
      failure: (error) {
        print('Error fetching recipe: $error');
      },
    );

    result.when(
      success: (ingredients) {
        _state = _state.copyWith(
          recipe: recipe,
          ingredients: ingredients,
          isLoading: false,
        );
      },
      failure: (error) {
        _state = _state.copyWith(isLoading: false);
        print('Error fetching ingredients: $error');
      },
    );

    notifyListeners();
  }
}