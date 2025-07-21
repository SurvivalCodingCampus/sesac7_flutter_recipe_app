import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required int id,
    required String name,
    required String imgSrc,
    required int amount,
  }) = _Ingredient;
}
