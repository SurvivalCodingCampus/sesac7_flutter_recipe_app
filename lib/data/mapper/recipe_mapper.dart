import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';

extension RecipeMapper on Recipe {
  Recipe toRecipe() {
    return Recipe(
      category: category ?? '',
      id: id ?? 0,
      name: name ?? '',
      image: image ?? '',
      chef: chef ?? '',
      rating: rating ?? 0,
      minute: minute ?? 0,
      ingredients: ingredients ?? [],
    );
  }
}
