import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String category,
    required int id,
    required String name,
    required String imageUrl,
    required String chef,
    required String time,
    required double rating,
    required DateTime createdAt,
  }) = _Recipe;
}
