import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/search_state_type.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "search_recipes_state.freezed.dart";

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
