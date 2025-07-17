import 'package:flutter_recipe_app/data/dto/recipe/ingredient_dto.dart';

class IngredientsDto {
  IngredientDto? ingredient;
  int? amount;

  IngredientsDto({this.ingredient, this.amount});

  factory IngredientsDto.fromJson(Map<String, dynamic> json) => IngredientsDto(
    ingredient: json['ingredient'] == null
        ? null
        : IngredientDto.fromJson(
            json['ingredient'] as Map<String, dynamic>,
          ),
    amount: json['amount'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'ingredient': ingredient?.toJson(),
    'amount': amount,
  };
}
