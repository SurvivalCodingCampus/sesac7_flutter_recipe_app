import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/model/ingredient_tab_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "ingredient_state.freezed.dart";

@freezed
abstract class IngredientState with _$IngredientState {
  const factory IngredientState({
    @Default(Recipe.empty) Recipe recipe,
    @Default([]) List<Ingredient> ingredients,
    @Default([]) List<String> procedure,
    @Default('') String reviewCount,
    @Default(IngredientTabType.ingredient) IngredientTabType tabType,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _IngredientState;
}
