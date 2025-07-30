import 'package:freezed_annotation/freezed_annotation.dart';

part "recipe.freezed.dart";

@freezed
abstract class Recipe with _$Recipe {
  static const String invalidId = 'invalid_id';

  static const Recipe empty = Recipe(
    id: '',
    category: '',
    name: '',
    imageUrl: '',
    imageWithoutBackground: '',
    creator: '',
    cookingTime: '',
    rating: 0,
    reviewCount: 0,
    serve: 0,
    isSaved: false,
  );

  const factory Recipe({
    required String id,
    required String category,
    required String name,
    required String imageUrl,
    required String imageWithoutBackground,
    required String creator,
    required String cookingTime,
    required double rating,
    required int reviewCount,
    required int serve,
    required bool isSaved,
  }) = _Recipe;
}
