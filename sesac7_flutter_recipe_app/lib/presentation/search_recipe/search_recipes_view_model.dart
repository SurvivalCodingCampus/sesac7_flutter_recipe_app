import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository/recipe_repository.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  SearchRecipesState _searchRecipesState = SearchRecipesState();

  SearchRecipesState get searchRecipesState => _searchRecipesState;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<void> fetchRecentRecipes() async {
    _searchRecipesState = searchRecipesState.copyWith(isLoading: true);
    notifyListeners();
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .getRecentRecipes();
    switch (result) {
      case Success():
        _searchRecipesState = _searchRecipesState.copyWith(
          recentRecipes: result.data,
        );
        break;
      case Error():
        _searchRecipesState = _searchRecipesState.copyWith(recentRecipes: []);
        break;
    }
    _searchRecipesState = searchRecipesState.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> fetchSearchResultRecipes({
    String? keyword,
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  }) async {
    _searchRecipesState = searchRecipesState.copyWith(
      isLoading: true,
      isCategorySearch: keyword == null,
      searchKeyword: keyword ?? '',
    );
    notifyListeners();
    final Result<List<Recipe>, NetworkError> result = await _recipeRepository
        .searchRecipes(keyword, timeType, ratingType, categoryType);
    switch (result) {
      case Success():
        _searchRecipesState = _searchRecipesState.copyWith(
          searchResultRecipes: result.data.isEmpty ? [] : result.data,
        );
        break;
      case Error():
        _searchRecipesState = _searchRecipesState.copyWith(
          searchResultRecipes: [],
        );
        break;
    }
    _searchRecipesState = searchRecipesState.copyWith(isLoading: false);
    notifyListeners();
  }

  void clearSearchResultRecipesAndSearchKeyword() {
    _searchRecipesState = searchRecipesState.copyWith(isLoading: true);
    notifyListeners();
    _searchRecipesState = searchRecipesState.copyWith(
      searchKeyword: '',
      searchResultRecipes: [],
      isCategorySearch: false,
    );
    _searchRecipesState = searchRecipesState.copyWith(isLoading: false);
    notifyListeners();
  }

}
