import 'package:flutter_recipe_app/data/dto/recipe/recipe_ingredient_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe/ingredient_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe_ingredient.dart';

class RecipeIngredientMapper {
  static RecipeIngredient fromDto(RecipeIngredientDto dto) {
    final Ingredient ingredient = dto.ingredient != null
        ? IngredientMapper.fromDto(dto.ingredient!)
        : Ingredient(id: 0, name: "ingredient", image: "imageUrl");

    return RecipeIngredient(ingredient: ingredient, amount: dto.amount ?? 0);
  }

  static RecipeIngredientDto toDto(RecipeIngredient model) {
    return RecipeIngredientDto(
      ingredient: IngredientMapper.toDto(model.ingredient),
      amount: model.amount,
    );
  }
}
