import 'package:flutter_recipe_app/data/dto/ingredients_dto.dart';
import 'package:flutter_recipe_app/data/mapper/ingredient_mapper.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';

extension IngredientsDtoToModel on IngredientsDto {
  Ingredients toModel() {
    return Ingredients(
      ingredient: ingredient!.toModel(),
      amount: amount!.toInt(),
    );
  }
}

extension IngredientsModelToDto on Ingredients {
  IngredientsDto toDto() {
    return IngredientsDto(
      ingredient: ingredient.toDto(),
      amount: amount.toInt(),
    );
  }
}
