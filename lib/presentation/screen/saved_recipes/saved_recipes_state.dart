import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "saved_recipes_state.freezed.dart";

@freezed
abstract class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) List<Recipe> savedRecipes,
    @Default(null) String? errorMessage,
  }) = _SavedRecipesState;
}
