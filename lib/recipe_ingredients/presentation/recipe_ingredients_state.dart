import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/domain/model/ingredient.dart';
import '../../core/domain/model/recipe.dart';

part 'recipe_ingredients_state.freezed.dart';

@freezed
abstract class RecipeIngredientsState with _$RecipeIngredientsState {
  const factory RecipeIngredientsState({
    @Default(0) int recipeId,
    @Default([]) List<Ingredient> ingredients,
    @Default(false) bool isLoading,
    Recipe? recipe,
  }) = _RecipeIngredientsState;
}