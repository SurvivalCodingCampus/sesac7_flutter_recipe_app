import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/model/ingredient_tab_type.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_all_ingredients_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_procedure_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/format_review_count_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final String recipeId;
  final FetchRecipeUseCase _fetchRecipeUseCase;
  final FetchAllIngredientsUseCase _fetchAllIngredientsUseCase;
  final FetchProcedureUseCase _fetchProcedureUseCase;
  final FormatReviewCountUseCase _formatReviewCountUseCase;

  IngredientState _state = IngredientState();

  IngredientViewModel({
    required this.recipeId,
    required FetchRecipeUseCase fetchRecipeUseCase,
    required FetchAllIngredientsUseCase fetchAllIngredientsUseCase,
    required FetchProcedureUseCase fetchProcedureUseCase,
    required FormatReviewCountUseCase formatReviewCountUseCase,
  }) : _fetchRecipeUseCase = fetchRecipeUseCase,
       _fetchAllIngredientsUseCase = fetchAllIngredientsUseCase,
       _fetchProcedureUseCase = fetchProcedureUseCase,
       _formatReviewCountUseCase = formatReviewCountUseCase;

  IngredientState get state => _state;

  void init() async {
    _state = state.copyWith(isLoading: true);

    notifyListeners();

    final recipeResult = await _fetchRecipeUseCase.execute(recipeId);

    switch (recipeResult) {
      case Success<Recipe, NetworkError>():
        final recipe = recipeResult.data;
        final reviewCount = _formatReviewCountUseCase.execute(
          recipe.reviewCount,
        );
        _state = state.copyWith(
          recipe: recipe,
          reviewCount: reviewCount,
          isLoading: false,
        );
      case Error<Recipe, NetworkError>():
        _errorState(recipeResult.error.toString());
        return;
    }

    final ingredientsResult = await _fetchAllIngredientsUseCase.execute(
      recipeId,
    );

    switch (ingredientsResult) {
      case Success<List<Ingredient>, NetworkError>():
        _state = state.copyWith(
          ingredients: ingredientsResult.data,
          isLoading: false,
        );
      case Error<List<Ingredient>, NetworkError>():
        _errorState(ingredientsResult.error.toString());
        return;
    }

    final procedureResult = await _fetchProcedureUseCase.execute(recipeId);

    switch (procedureResult) {
      case Success<List<String>, NetworkError>():
        _state = state.copyWith(
          procedure: procedureResult.data,
          isLoading: false,
        );
      case Error<List<String>, NetworkError>():
        _errorState(procedureResult.error.toString());
        return;
    }

    notifyListeners();
  }

  void fetchRecipe() async {
    _state = state.copyWith(isLoading: true);
    final result = await _fetchRecipeUseCase.execute(recipeId);

    switch (result) {
      case Success<Recipe, NetworkError>():
        final recipe = result.data;
        final reviewCount = _formatReviewCountUseCase.execute(
          recipe.reviewCount,
        );
        _state = state.copyWith(
          recipe: recipe,
          reviewCount: reviewCount,
          isLoading: false,
        );
      case Error<Recipe, NetworkError>():
        _errorState(result.error.toString());
    }

    notifyListeners();
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

    notifyListeners();
  }

  void fetchProcedure() async {
    _state = state.copyWith(isLoading: true);

    notifyListeners();

    final result = await _fetchProcedureUseCase.execute(recipeId);

    switch (result) {
      case Success<List<String>, NetworkError>():
        _state = state.copyWith(procedure: result.data, isLoading: false);
      case Error<List<String>, NetworkError>():
        _errorState(result.error.toString());
    }

    notifyListeners();
  }

  void tabChange(int index) {
    _state = state.copyWith(tabType: IngredientTabType.values[index]);

    notifyListeners();
  }

  void _errorState(String message) {
    _state = state.copyWith(
      errorMessage: message,
      isLoading: false,
    );

    notifyListeners();
  }
}
