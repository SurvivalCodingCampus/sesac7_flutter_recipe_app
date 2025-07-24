import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipe.dart';

part 'ingredient_screen_state.freezed.dart';
part 'ingredient_screen_state.g.dart';

@freezed
abstract class IngredientScreenState with _$IngredientScreenState {
  const factory IngredientScreenState({
    @Default(false) bool isLoading,
    @Default(0) int indexOfTab,
    @Default('') String quantityOfItems,
    @Default(
      Recipe(
        category: '',
        id: -1,
        name: '',
        image: '',
        chef: '',
        cookingTime: '',
        rating: -1.0,
        ingredients: [],
      ),
    )
    Recipe selectedRecipe,
    @Default([]) List<String> steps,
  }) = _IngredientScreenState;

  factory IngredientScreenState.fromJson(Map<String, Object?> json) =>
      _$IngredientScreenStateFromJson(json);
}
