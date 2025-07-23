import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "ingredient_state.freezed.dart";

@freezed
abstract class IngredientState with _$IngredientState {
  const factory IngredientState({
    @Default(
      Recipe(
        id: '',
        category: '',
        name: '',
        imageUrl: '',
        creator: '',
        cookingTime: '',
        rating: 0,
        ingredients: [],
      ),
    )
    Recipe recipe,
    @Default('') String reviewCount,
    @Default(0) int serve,
    @Default([]) List<Ingredient> ingredients,
    @Default([]) List<String> procedure,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _IngredientState;
}
