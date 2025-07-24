import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/home/domain/use_case/fetch_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final FetchAllRecipesUseCase _fetchAllRecipesUseCase;

  HomeState _state = HomeState();

  HomeViewModel({required FetchAllRecipesUseCase fetchAllRecipesUseCase})
    : _fetchAllRecipesUseCase = fetchAllRecipesUseCase;

  HomeState get state => _state;

  void fetchAllRecipes() async {
    _loadingState();

    final result = await _fetchAllRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _state = state.copyWith(
          recipes: result.data,
          isLoading: false,
          errorMessage: '',
        );

        notifyListeners();
      case Error<List<Recipe>, NetworkError>():
        _errorState(result.error.toString());
    }
  }

  void _loadingState() {
    _state = state.copyWith(isLoading: true);

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
