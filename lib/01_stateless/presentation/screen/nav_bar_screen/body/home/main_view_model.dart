import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/usecase/get_recipes_by_category_use_case.dart';

class MainViewModel with ChangeNotifier {
  final GetRecipeByCategoryUseCase _getRecipeByCategoryUseCase;
  String userId = "monkey96";
  int index = 0;
  final List<String> tabs = [
    'All',
    'Indian',
    'Korean',
    'Italian',
    'Japanese',
    'Chinese',
    'Radioactive'
  ];

  MainViewModel({
    required GetRecipeByCategoryUseCase getRecipeByCategoryUseCase,
  }) : _getRecipeByCategoryUseCase = getRecipeByCategoryUseCase;

  List<Recipe> _currentRecipes = [];
  bool _isLoading = false;

  UnmodifiableListView<Recipe> get currentRecipes => UnmodifiableListView(_currentRecipes);
  bool get isLoading => _isLoading;
  
  Future<void> fetchRecipeData() async {
    _isLoading = true;
    notifyListeners();
    
    _currentRecipes = await _getRecipeByCategoryUseCase.execute(tabs[index]);
    _isLoading = false;
    notifyListeners();
  }
}