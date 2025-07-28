import 'dart:async';

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
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_action.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_event.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final FetchRecipeUseCase _fetchRecipeUseCase;
  final FetchAllIngredientsUseCase _fetchAllIngredientsUseCase;
  final FetchProcedureUseCase _fetchProcedureUseCase;
  final FormatReviewCountUseCase _formatReviewCountUseCase;
  final StreamController<IngredientEvent> _streamController =
      StreamController();

  IngredientState _state = IngredientState();

  IngredientViewModel({
    required FetchRecipeUseCase fetchRecipeUseCase,
    required FetchAllIngredientsUseCase fetchAllIngredientsUseCase,
    required FetchProcedureUseCase fetchProcedureUseCase,
    required FormatReviewCountUseCase formatReviewCountUseCase,
  }) : _fetchRecipeUseCase = fetchRecipeUseCase,
       _fetchAllIngredientsUseCase = fetchAllIngredientsUseCase,
       _fetchProcedureUseCase = fetchProcedureUseCase,
       _formatReviewCountUseCase = formatReviewCountUseCase;

  IngredientState get state => _state;
  Stream<IngredientEvent> get eventStream => _streamController.stream;

  void init({required String recipeId}) async {
    _loadingState();

    final results = await Future.wait([
      _fetchRecipeUseCase.execute(recipeId),
      _fetchAllIngredientsUseCase.execute(recipeId),
      _fetchProcedureUseCase.execute(recipeId),
    ]);
    final recipeResult = results[0] as Result<Recipe, NetworkError>;
    final ingredientsResult =
        results[1] as Result<List<Ingredient>, NetworkError>;
    final procedureResult = results[2] as Result<List<String>, NetworkError>;

    switch (recipeResult) {
      case Success<Recipe, NetworkError>():
        final recipe = recipeResult.data;
        final reviewCount = _formatReviewCountUseCase.execute(
          recipe.reviewCount,
        );
        _state = state.copyWith(
          recipe: recipe,
          reviewCount: reviewCount,
        );
      case Error<Recipe, NetworkError>():
        _errorState(recipeResult.error.toString());
        return;
    }

    switch (ingredientsResult) {
      case Success<List<Ingredient>, NetworkError>():
        _state = state.copyWith(
          ingredients: ingredientsResult.data,
        );
      case Error<List<Ingredient>, NetworkError>():
        _errorState(ingredientsResult.error.toString());
        return;
    }

    switch (procedureResult) {
      case Success<List<String>, NetworkError>():
        _state = state.copyWith(
          procedure: procedureResult.data,
        );
      case Error<List<String>, NetworkError>():
        _errorState(procedureResult.error.toString());
        return;
    }

    _state = state.copyWith(isLoading: false);

    notifyListeners();
  }

  void onAction(IngredientAction action) async {
    switch (action) {
      case TapBack():
        break;
      case TapMenu():
        break;
      case TapRecipeBookmark():
        // TODO: tap recipe bookmark.
        print(action);
      case TapFollow():
        // TODO: tap follow.
        print(action);
      case ChangeTab():
        _tabChange(action.index);
    }

    notifyListeners();
  }

  void _tabChange(int index) {
    _state = state.copyWith(tabType: IngredientTabType.values[index]);

    notifyListeners();
  }

  void _loadingState() {
    _state = state.copyWith(isLoading: true);

    notifyListeners();
  }

  void _errorState(String message) {
    _state = state.copyWith(
      isLoading: false,
    );

    _streamController.add(IngredientEvent.openErrorDialog(message));

    notifyListeners();
  }
}
