import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "recipe.freezed.dart";

@freezed
abstract class Recipe with _$Recipe {
  static const String invalidId = 'invalid_id';

  const factory Recipe({
    required String id,
    required String category,
    required String name,
    required String imageUrl,
    required String creator,
    required String cookingTime,
    required double rating,
    required int reviewCount,
    required int serve,
    required List<Ingredient> ingredients,
  }) = _Recipe;
}
