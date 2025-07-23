import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required num id,
    required String name,
    required String image,
  }) = _Ingredient;
}
