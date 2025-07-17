import 'package:flutter_recipe_app/data/dto/recipe/ingredient_dto.dart';

class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final int? amount;

  RecipeIngredientDto({
    required this.ingredient,
    required this.amount,
  });


  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientDto(
      ingredient: json['ingredient'] is Map<String, dynamic>
          ? IngredientDto.fromJson(json['ingredient'] as Map<String, dynamic>)
          : null,
      amount: json['amount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient?.toJson(),
      'amount': amount,
    };
  }
}