import 'package:flutter_recipe_app/data/dto/recipe/ingredient_dto.dart';

class IngredientListDto {
  IngredientDto? ingredient;
  int? amount;

  IngredientListDto({this.ingredient, this.amount});

  factory IngredientListDto.fromJson(Map<String, dynamic> json) =>
      IngredientListDto(
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
