import 'package:freezed_annotation/freezed_annotation.dart';

part "ingredient.freezed.dart";

@freezed
class Ingredient with _$Ingredient {
  static const String invalidId = 'invalid_id';

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final double weight;

  const Ingredient({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
  });
}
