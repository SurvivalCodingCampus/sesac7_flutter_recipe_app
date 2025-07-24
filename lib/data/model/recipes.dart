import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredients.dart';

part 'recipes.freezed.dart';

@freezed
abstract class Recipes with _$Recipes {
  const factory Recipes({
    required String category,
    required int id,
    required String name,
    required String image,
    required String chef,
    required String time,
    required double rating,
    required List<Ingredients> ingredients,
    required bool isBookmarked,
  }) = _Recipes;
}
