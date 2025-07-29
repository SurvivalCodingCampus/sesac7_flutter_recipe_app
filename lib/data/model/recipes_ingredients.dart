import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes_ingredients.freezed.dart';

@freezed
abstract class RecipesIngredients with _$RecipesIngredients {
  const factory RecipesIngredients({
    required int id,
    required String name,
    required String imageUrl,
  }) = _RecipesIngredients;
}
