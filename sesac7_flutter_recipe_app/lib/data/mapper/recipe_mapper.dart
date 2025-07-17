import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/data/mapper/ingredients_mapper.dart';
import 'package:flutter_recipe_app/data/model/ingredients.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';

extension RecipeDtoToModel on RecipeDto {
  Recipe toModel() {
    return Recipe(
      category: category!,
      id: id!.toInt(),
      name: name!,
      image: image!,
      chef: chef!,
      time: time!,
      rating: rating!.toDouble(),
      ingredients: ingredients?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}

extension RecipeModelToDto on Recipe {
  RecipeDto toDto() {
    return RecipeDto(
      category: category,
      id: id.toInt(),
      name: name,
      image: image,
      chef: chef,
      time: time,
      rating: rating.toDouble(),
      ingredients: ingredients
          .map((model) => (model as Ingredients).toDto())
          .toList(),
    );
  }
}
