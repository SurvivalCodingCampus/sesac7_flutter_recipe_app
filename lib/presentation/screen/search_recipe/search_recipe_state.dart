import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe/filter_search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipe_state.freezed.dart";

@freezed
abstract class SearchRecipeState with _$SearchRecipeState {
  static const String recentSearch = 'Recent Search';
  static const String searchResult = 'Search Result';

  const factory SearchRecipeState({
    @Default([]) List<Recipe> allRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default(SearchRecipeState.recentSearch) String searchState,
    @Default('') String searchFieldValue,
    @Default(0) int resultCount,
    @Default(FilterSearchState()) FilterSearchState filterState,
    @Default(null) String? errorMessage,
    @Default(true) bool isLoading,
  }) = _SearchRecipeState;
}
