import 'package:flutter_recipe_app/core/data/dto/recipe/ingredient_dto.dart';
import 'package:flutter_recipe_app/core/data/dto/recipe/ingredients_dto.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';

extension IngredientsDtoToModel on IngredientsDto {
  Ingredient toModel() {
    return Ingredient(
      id: _initId(ingredient?.id),
      name: ingredient?.name ?? '',
      imageUrl: ingredient?.image ?? '',
      weight: amount?.toDouble() ?? 0,
    );
  }

  String _initId(int? id) {
    return id?.toString() ?? Ingredient.invalidId;
  }
}

extension IngredientsModelToDto on Ingredient {
  IngredientsDto toDto() {
    return IngredientsDto(
      ingredient: IngredientDto(
        id: int.tryParse(id) ?? -1,
        name: name,
        image: imageUrl,
      ),
      amount: weight.toInt(),
    );
  }
}
