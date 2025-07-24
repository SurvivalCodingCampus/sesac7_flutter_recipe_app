import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

@freezed
abstract class IngredientState with _$IngredientState {
  const factory IngredientState({
    Recipe? recipe,
  }) = _IngredientState;
}
