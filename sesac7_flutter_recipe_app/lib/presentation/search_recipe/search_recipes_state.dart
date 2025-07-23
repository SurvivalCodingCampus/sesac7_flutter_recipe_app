import 'dart:collection';

import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default('') String searchKeyword,
    @Default([]) List<Recipe> recentRecipes,
    @Default([]) List<Recipe> searchResultRecipes,
    @Default(false) bool isCategorySearch,
    @Default(false) bool isLoading,
  }) = _SearchRecipesState;
}
