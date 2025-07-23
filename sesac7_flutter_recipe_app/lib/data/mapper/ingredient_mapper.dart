import 'package:flutter_recipe_app/data/dto/ingredient_dto.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';

extension IngredientDtoToModel on IngredientDto {
  Ingredient toModel() {
    return Ingredient(
      id: id!.toInt(),
      name: name!,
      image: image!,
    );
  }
}

extension IngredientModelToDto on Ingredient {
  IngredientDto toDto() {
    return IngredientDto(
      id: id.toDouble(),
      name: name,
      image: image,
    );
  }
}
