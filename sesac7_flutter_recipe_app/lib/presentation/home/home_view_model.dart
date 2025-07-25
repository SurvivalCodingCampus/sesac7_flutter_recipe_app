import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  final GetRecipesCategoryListUseCase _getRecipesCategoryListUseCase;
  final GetRecipesByCategory _getRecipesByCategory;

  HomeViewModel({
    required GetRecipesUseCase getRecipesUseCase,
    required GetRecipesCategoryListUseCase getRecipesCategoryListUseCase,
    required GetRecipesByCategory getRecipesByCategory,
  }) : _getRecipesUseCase = getRecipesUseCase,
       _getRecipesCategoryListUseCase = getRecipesCategoryListUseCase,
       _getRecipesByCategory = getRecipesByCategory;

  HomeState _homeState = HomeState();

  HomeState get homeState => _homeState;

  Future<void> loadCategories() async {
    final result = await _getRecipesCategoryListUseCase.execute();
    switch (result) {
      case Success<Set<String>, NetworkError>():
        _homeState = _homeState.copyWith(categories: result.data);
      case Error<Set<String>, NetworkError>():
        _homeState = _homeState.copyWith(categories: {});
    }
    notifyListeners();
  }

  Future<void> fetchAllCategoryRecipes() async {
    final Result<List<Recipe>, NetworkError> result = await _getRecipesUseCase
        .execute();
    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _homeState = _homeState.copyWith(
          category: 'All',
          categoryRecipes: result.data,
        );
      case Error<List<Recipe>, NetworkError>():
        _homeState = _homeState.copyWith(
          category: 'All',
          categoryRecipes: [],
        );
    }
    notifyListeners();
  }

  Future<void> fetchCategoryRecipes(String category) async {
    final Result<List<Recipe>, NetworkError> result =
        await _getRecipesByCategory.execute(category);

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        _homeState = _homeState.copyWith(
          category: category,
          categoryRecipes: result.data,
        );
      case Error<List<Recipe>, NetworkError>():
        _homeState = _homeState.copyWith(
            category: category,
            categoryRecipes: []
        );
    }
    notifyListeners();
  }
}
