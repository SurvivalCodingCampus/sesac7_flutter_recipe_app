import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';

import '../../../data/data_source/db/dao/recipe_dao.dart';
import '../../../di/di_setup.dart';
import '../../../domain/use_case/fetch_recipes_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetRecipesUseCase _fetchRecipesUseCase;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  SavedRecipesViewModel({
    required GetRecipesUseCase fetchRecipesUseCase,
  }) : _fetchRecipesUseCase = fetchRecipesUseCase;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await _fetchRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>>():
        _recipes = result.data;
      case Error<List<Recipe>>():
        _recipes = [];
        _errorMessage = result.message;
    }
    _isLoading = false;
    notifyListeners();

    print(await getIt<RecipeDao>().getAllRecipes());
  }
}
