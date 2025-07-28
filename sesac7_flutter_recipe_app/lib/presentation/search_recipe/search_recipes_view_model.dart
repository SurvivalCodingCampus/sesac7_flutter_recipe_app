import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_event.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_action.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_state.dart';

class SearchRecipesViewModel extends ValueNotifier<SearchRecipesState> {
  final RecipeRepository _recipeRepository;
  final StreamController<SearchRecipesEvent> _eventController = StreamController<SearchRecipesEvent>();

  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  SearchRecipesViewModel({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository,
       super(SearchRecipesState());

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case ChangeKeyword():
        if (action.keyword.isEmpty) {
          _clearSearchResultRecipesAndSearchKeyword();
          fetchRecentRecipes();
        } else {
          _fetchSearchResultRecipes(
            keyword: action.keyword,
          );
        }
      case ShowFilterBottomSheet():
        break;
      case SearchFilteredRecipe():
        _fetchSearchResultRecipes(
          timeType: action.timeType,
          ratingType: action.ratingType,
          categoryType: action.categoryType,
        );
    }
  }

  Future<void> fetchRecentRecipes() async {
    value = value.copyWith(isLoading: true);
    notifyListeners();
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .getRecentRecipes();
    switch (result) {
      case Success():
        value = value.copyWith(
          recentRecipes: result.data,
        );
        break;
      case Error():
        value = value.copyWith(recentRecipes: []);
        break;
    }
    value = value.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> _fetchSearchResultRecipes({
    String? keyword,
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  }) async {
    value = value.copyWith(
      isLoading: true,
      isCategorySearch: keyword == null,
      searchKeyword: keyword ?? '',
    );
    notifyListeners();
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .searchRecipes(keyword, timeType, ratingType, categoryType);
    switch (result) {
      case Success():
        final List<Recipe> searchRecipes = result.data;
        if (searchRecipes.isEmpty) {
          value = value.copyWith(
            searchResultRecipes: [],
          );
          _eventController.add(SearchRecipesEvent.showEmptyResultError());
        } else {
          value = value.copyWith(
            searchResultRecipes: result.data,
          );
        }
      case Error():
        value = value.copyWith(
          searchResultRecipes: [],
        );
        break;
    }
    value = value.copyWith(isLoading: false);
    notifyListeners();
  }

  void _clearSearchResultRecipesAndSearchKeyword() {
    value = value.copyWith(isLoading: true);
    notifyListeners();
    value = value.copyWith(
      searchKeyword: '',
      searchResultRecipes: [],
      isCategorySearch: false,
    );
    value = value.copyWith(isLoading: false);
    notifyListeners();
  }
}
