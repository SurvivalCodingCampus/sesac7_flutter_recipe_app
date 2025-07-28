import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String name,
    required String author,
    required String image,
    required int duration,
    required double rating,
    required int id,
    required Set<String> categories,
    @Default(false) bool isBookmarked,
  }) = _Recipe;
}
