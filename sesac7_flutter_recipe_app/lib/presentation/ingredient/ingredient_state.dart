import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';

@freezed
abstract class IngredientState with _$IngredientState {
  const factory IngredientState({
    @Default(null) Recipe? currentSelectedRecipe,
    @Default(0) int selectedLabelIndex,
    @Default([]) List<Procedure> currentSelectedRecipeProcedures,
  }) = _IngredientState;
}
