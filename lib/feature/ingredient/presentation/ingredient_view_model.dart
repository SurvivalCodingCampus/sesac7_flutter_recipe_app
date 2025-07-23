import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_all_ingredients_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_procedure_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final String recipeId;
  final FetchRecipeUseCase _fetchRecipeUseCase;
  final FetchAllIngredientsUseCase _fetchAllIngredientsUseCase;
  final FetchProcedureUseCase _fetchProcedureUseCase;

  IngredientState _state = IngredientState();

  IngredientViewModel({
    required this.recipeId,
    required FetchRecipeUseCase fetchRecipeUseCase,
    required FetchAllIngredientsUseCase fetchAllIngredientsUseCase,
    required FetchProcedureUseCase fetchProcedureUseCase,
  }) : _fetchRecipeUseCase = fetchRecipeUseCase,
       _fetchAllIngredientsUseCase = fetchAllIngredientsUseCase,
       _fetchProcedureUseCase = fetchProcedureUseCase;

  IngredientState get state => _state;

  void fetchRecipe() async {
    _state = state.copyWith(isLoading: true);
    final result = await _fetchRecipeUseCase.execute(recipeId);

    switch (result) {
      case Success<Recipe, NetworkError>():
        _state = state.copyWith(recipe: result.data, isLoading: false);
      case Error<Recipe, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  void fetchIngredients() async {
    _state = state.copyWith(isLoading: true);
    final result = await _fetchAllIngredientsUseCase.execute(recipeId);

    switch (result) {
      case Success<List<Ingredient>, NetworkError>():
        _state = state.copyWith(ingredients: result.data, isLoading: false);
      case Error<List<Ingredient>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  void fetchProcedure() async {
    _state = state.copyWith(isLoading: true);
    final result = await _fetchProcedureUseCase.execute(recipeId);

    switch (result) {
      case Success<List<String>, NetworkError>():
        _state = state.copyWith(procedure: result.data, isLoading: false);
      case Error<List<String>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  void _errorState(String message) {
    _state = state.copyWith(
      errorMessage: message,
      isLoading: false,
    );
  }
}
