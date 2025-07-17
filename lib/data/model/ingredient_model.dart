import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
abstract class IngredientModel with _$IngredientModel {
  const factory IngredientModel({
    required String name, // 재료명
    required String quantity, // 수량 및 단위
    required String imageUrl, // 재료 이미지 URL,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, Object?> json) => _$IngredientModelFromJson(json);
}
