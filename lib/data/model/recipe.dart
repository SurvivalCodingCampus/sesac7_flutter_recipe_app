import 'package:flutter_recipe_app/data/model/recipe_ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String category,
    required num id,
    required String name,
    required String image,
    required String chef,
    required String time,
    required num rating,
    required List<RecipeIngredient> ingredients,
  }) = _Recipe;
}
