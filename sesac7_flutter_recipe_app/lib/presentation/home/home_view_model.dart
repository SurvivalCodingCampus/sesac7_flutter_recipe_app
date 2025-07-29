import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/add_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_ids_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_action.dart';
import 'package:flutter_recipe_app/presentation/home/home_state.dart';

class HomeViewModel extends ValueNotifier<HomeState> {
  final GetRecipesUseCase _getRecipesUseCase;
  final GetRecipesCategoryListUseCase _getRecipesCategoryListUseCase;
  final GetRecipesByCategory _getRecipesByCategory;
  final GetSavedRecipeIdsUseCase _getSavedRecipeIdsUseCase;
  final GetSavedRecipeFindByIdUseCase _getSavedRecipeFindByIdUseCase;
  final RemoveSavedRecipeUseCase _removeSavedRecipeUseCase;
  final AddSavedRecipeUseCase _addSavedRecipeUseCase;
  final GetBookmarkChangedStreamUseCase _bookmarkChangedStreamUseCase;

  Stream<void> get bookmarkChangedStream =>
      _bookmarkChangedStreamUseCase.execute();

  HomeViewModel({
    required GetRecipesUseCase getRecipesUseCase,
    required GetRecipesCategoryListUseCase getRecipesCategoryListUseCase,
    required GetRecipesByCategory getRecipesByCategory,
    required GetSavedRecipeIdsUseCase getSavedRecipeIdsUseCase,
    required GetSavedRecipeFindByIdUseCase getSavedRecipeFindByIdUseCase,
    required RemoveSavedRecipeUseCase removeSavedRecipeUseCase,
    required AddSavedRecipeUseCase addSavedRecipeUseCase,
    required GetBookmarkChangedStreamUseCase bookmarkChangedStreamUseCase,
  }) : _getRecipesUseCase = getRecipesUseCase,
       _getRecipesCategoryListUseCase = getRecipesCategoryListUseCase,
       _getRecipesByCategory = getRecipesByCategory,
       _getSavedRecipeIdsUseCase = getSavedRecipeIdsUseCase,
       _getSavedRecipeFindByIdUseCase = getSavedRecipeFindByIdUseCase,
       _removeSavedRecipeUseCase = removeSavedRecipeUseCase,
       _addSavedRecipeUseCase = addSavedRecipeUseCase,
       _bookmarkChangedStreamUseCase = bookmarkChangedStreamUseCase,
       super(HomeState());

  void onAction(HomeAction action) async {
    switch (action) {
      case SelectCategory():
        if (action.category == 'All') {
          fetchAllCategoryRecipes();
        } else {
          _fetchCategoryRecipes(action.category);
        }
      case MoveSearchRecipeScreen():
        break;
      case FavoriteStateChange():
        if (await _isSavedRecipe(action.recipeId)) {
          _removeFavoriteRecipe(action.recipeId);
        } else {
          _addFavoriteRecipe(action.recipeId);
        }
    }
  }

  Future<void> loadCategories() async {
    final result = await _getRecipesCategoryListUseCase.execute();
    switch (result) {
      case Success<Set<String>, NetworkError>():
        value = value.copyWith(categories: result.data);
      case Error<Set<String>, NetworkError>():
        value = value.copyWith(categories: {});
    }
    notifyListeners();
  }

  Future<void> fetchAllCategoryRecipes() async {
    final Result<List<Recipe>, NetworkError> result = await _getRecipesUseCase
        .execute();
    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        value = value.copyWith(
          category: 'All',
          categoryRecipes: result.data,
        );
      case Error<List<Recipe>, NetworkError>():
        value = value.copyWith(
          category: 'All',
          categoryRecipes: [],
        );
    }
    notifyListeners();
  }

  Future<void> _fetchCategoryRecipes(String category) async {
    final Result<List<Recipe>, NetworkError> result =
        await _getRecipesByCategory.execute(category);

    switch (result) {
      case Success<List<Recipe>, NetworkError>():
        value = value.copyWith(
          category: category,
          categoryRecipes: result.data,
        );
      case Error<List<Recipe>, NetworkError>():
        value = value.copyWith(category: category, categoryRecipes: []);
    }
    notifyListeners();
  }

  Future<void> loadSavedRecipeIds() async {
    final Result<List<int>, String> result = await _getSavedRecipeIdsUseCase
        .execute();
    switch (result) {
      case Success<List<int>, String>():
        value = value.copyWith(savedRecipeIds: result.data);
      case Error<List<int>, String>():
        value = value.copyWith(savedRecipeIds: []);
    }
    notifyListeners();
  }

  Future<bool> _isSavedRecipe(int recipeId) async {
    final Result<Recipe?, String> result = await _getSavedRecipeFindByIdUseCase
        .execute(recipeId);

    switch (result) {
      case Success<Recipe?, String>():
        return result.data != null;
      case Error<Recipe?, String>():
        return false;
    }
  }

  Future<void> _addFavoriteRecipe(int recipeId) async {
    await _addSavedRecipeUseCase.execute(recipeId);
  }

  Future<void> _removeFavoriteRecipe(int recipeId) async {
    await _removeSavedRecipeUseCase.execute(recipeId);
  }
}
