import 'package:freezed_annotation/freezed_annotation.dart';

part "ingredient.freezed.dart";

@freezed
abstract class Ingredient with _$Ingredient {
  static const String invalidId = 'invalid_id';

  const factory Ingredient({
    required String id,
    required String name,
    required String imageUrl,
    required double weight,
  }) = _Ingredient;
}
