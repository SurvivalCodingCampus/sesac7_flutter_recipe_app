import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "home_state.freezed.dart";

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Recipe> allRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default(HomeRecipeCategory.all) HomeRecipeCategory selectedCategory,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _HomeState;
}
