import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/domain/model/ingredient.dart';

part 'recipe_ingredients_state.freezed.dart';

@freezed
abstract class RecipeIngredientsState with _$RecipeIngredientsState {
  const factory RecipeIngredientsState({
    @Default([]) List<Ingredient> ingredients,
    @Default(false) bool isLoading,
  }) = _RecipeIngredientsState;
}