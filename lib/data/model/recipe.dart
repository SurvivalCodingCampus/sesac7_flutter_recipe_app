import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String category,
    required int id,
    required String name,
    required String image,
    required String chef,
    required String cookingTime,
    required double rating,
    required List<Ingredient> ingredients,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
