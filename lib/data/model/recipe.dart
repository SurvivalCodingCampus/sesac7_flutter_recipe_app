import 'package:flutter_recipe_app/data/model/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String category,
    required int id,
    required String name,
    required String imgSrc,
    required String chef,
    required int time,
    required int rating,
    required List<Ingredient> ingredients,
  }) = _Recipe;
}
