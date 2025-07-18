import 'package:flutter_recipe_app/data/model/recipe/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'recipe_ingredient.freezed.dart';
part 'recipe_ingredient.g.dart';

@freezed
abstract class RecipeIngredient with _$RecipeIngredient { // abstract class 추가
  const factory RecipeIngredient({
    required Ingredient ingredient, // Ingredient 모델 타입의 필드
    required int amount,           // int 타입의 필드 (num 대신 int)
  }) = _RecipeIngredient;

  factory RecipeIngredient.fromJson(Map<String, Object?> json) => _$RecipeIngredientFromJson(json);
}