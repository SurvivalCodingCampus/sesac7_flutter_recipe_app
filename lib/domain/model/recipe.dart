
import 'package:flutter_recipe_app/domain/model/recipe_ingredient.dart';
import 'package:flutter_recipe_app/domain/model/step_Info.dart';
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
    required bool isSaved,
    required List<RecipeIngredient> ingredients,
    required List<StepInfo> steps, // 조리설명 및 순서
  }) = _Recipe;
}
