import 'package:flutter_recipe_app/data/dto/recipe/ingredient_dto.dart';
import 'package:flutter_recipe_app/data/model/recipe/ingredient.dart';

class IngredientMapper {
  static Ingredient fromDto(IngredientDto dto) {
    return Ingredient(
      id: dto.id ?? 0,
      name: dto.name ?? "ingredient",
      image: dto.image ?? "imageUrl",
    );
  }

  static IngredientDto toDto(Ingredient model) {
    return IngredientDto(id: model.id, name: model.name, image: model.image);
  }
}
