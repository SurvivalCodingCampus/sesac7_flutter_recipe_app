import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipes_ingredients.dart';

part 'ingredients.freezed.dart';

@freezed
abstract class Ingredients with _$Ingredients {
  const factory Ingredients({
    required int id,
    required String name,
    required String image,
  }) = _Ingredients;
}
