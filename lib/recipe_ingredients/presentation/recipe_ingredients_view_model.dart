import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_state.dart';

import '../../core/domain/model/recipe.dart';
import '../../core/domain/repository/recipes_repository.dart';
import '../domain/use_case/fetch_recipe_use_case.dart';

class RecipeIngredientsViewModel with ChangeNotifier{
  final int recipeId;
  final FetchRecipeIngredientsUseCase _fetchRecipeUseCase;
  final RecipeRepository _recipeRepository;

  RecipeIngredientsState _state = RecipeIngredientsState();
  RecipeIngredientsState get state => _state;

  RecipeIngredientsViewModel({
    required this.recipeId,
    required FetchRecipeIngredientsUseCase fetchRecipeUseCase,
    required RecipeRepository recipeRepository,
  })  : _fetchRecipeUseCase = fetchRecipeUseCase,
        _recipeRepository = recipeRepository;


  Future<void> fetchRecipeIngredients() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _fetchRecipeUseCase.execute(_state.recipeId);
    final recipeResult = await _recipeRepository.fetchRecipeById(recipeId);
    Recipe? recipe;

    print('레시피 아이디: $recipeId');
    print('레시피 결과: $recipeResult');

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