import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/model/recipe/search_state_type.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipes/filter_search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipe_state.freezed.dart";

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> allRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default(SearchStateType.recentSearch) SearchStateType searchState,
    @Default('') String searchFieldValue,
    @Default(0) int resultCount,
    @Default(FilterSearchState()) FilterSearchState filterState,
    @Default(null) String? errorMessage,
    @Default(true) bool isLoading,
  }) = _SearchRecipesState;
}
