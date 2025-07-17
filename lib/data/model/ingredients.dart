import 'package:flutter_recipe_app/data/model/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredients.freezed.dart';

part 'ingredients.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Ingredients with _$Ingredients {
  final Ingredient ingredient;
  final int amount;
  const Ingredients({
    required this.ingredient, required this.amount,
  });

  factory Ingredients.fromJson(Map<String, Object?> json) => _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}