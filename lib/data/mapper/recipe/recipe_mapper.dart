import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_ingredient_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe/recipe_ingredient_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe_ingredient.dart';

class RecipeMapper {
  static Recipe fromDto(RecipeDto dto) {
    final List<RecipeIngredient> ingredients =
        dto.ingredients
            ?.map(
              (ingredientDto) => RecipeIngredientMapper.fromDto(ingredientDto),
            )
            .whereType<RecipeIngredient>()
            .toList() ??
        [];

    return Recipe(
      id: dto.id ?? 0,
      category: dto.category ?? "category",
      name: dto.name ?? "recipe",
      image: dto.image ?? "imageUrl",
      chef: dto.chef ?? "chef",
      time: dto.time ?? "time",
      rating: dto.rating ?? 0.0,
      ingredients: ingredients,
    );
  }

  static RecipeDto toDto(Recipe model) {
    final List<RecipeIngredientDto> ingredientsDto = model.ingredients
        .map((ingredientModel) => RecipeIngredientMapper.toDto(ingredientModel))
        .toList();

    return RecipeDto(
      id: model.id,
      category: model.category,
      name: model.name,
      image: model.image,
      chef: model.chef,
      time: model.time,
      rating: model.rating,
      ingredients: ingredientsDto,
    );
  }
}
