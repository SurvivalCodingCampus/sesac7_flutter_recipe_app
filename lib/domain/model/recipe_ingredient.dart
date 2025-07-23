import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient.dart';

part 'recipe_ingredient.freezed.dart';

@freezed
abstract class RecipeIngredient with _$RecipeIngredient {
  const factory RecipeIngredient({
    required Ingredient ingredient,
    required num amount,
  }) = _RecipeIngredient;
}
