import 'package:flutter_recipe_app/data/model/recipe/category.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipe_state.freezed.dart';

@freezed
abstract class SearchRecipeState with _$SearchRecipeState {
  const factory SearchRecipeState({
    @Default([]) List<Recipe> recipes,
    @Default([]) List<Category> categories,
    @Default(false) bool isLoading,
  }) = _SearchRecipeState;
}