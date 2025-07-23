import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredients.freezed.dart';

@freezed
class Ingredients with _$Ingredients{
  @override
  final Ingredient ingredient;
  @override
  final num amount;

  Ingredients({
    required this.ingredient,
    required this.amount,
  });
}