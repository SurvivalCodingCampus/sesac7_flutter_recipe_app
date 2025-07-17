import 'package:flutter_recipe_app/data/model/step_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient_model.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
abstract class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    required String id, // 레시피 ID
    required String title, // 레시피 제목
    required String imageUrl, // 레시피 대표 이미지 URL
    required String description, // 간단한 레시피 설명
    required List<IngredientModel> ingredients,
    required List<StepModel> steps, // 조리설명 및 순서
    required int cookTimeMinutes, // 조리시간(분)
    required int servings, // 인분
    required String authorName, // 작성자 ID
    required double averageRating, // 평균별점
    required int reviewCount, // 리뷰 개수
    required String category, // 레시피 카테고리(한식, 양식 등)
    required bool isSavedByUser, // 내가 저장한 레시피 인지
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, Object?> json) => _$RecipeModelFromJson(json);
}
