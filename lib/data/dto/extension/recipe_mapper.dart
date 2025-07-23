
import '../../../domain/model/ingredient.dart';
import '../../../domain/model/recipe.dart';
import '../../../domain/model/recipe_ingredient.dart';
import '../recipe_dto.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      category: category ?? '',
      id: id ?? 0,
      name: name ?? '',
      image: image ?? '',
      chef: chef ?? '',
      time: time ?? '',
      rating: rating ?? 0,
      ingredients: ingredients?.map((e) => e.toRecipeIngredient()).toList() ?? [],
    );

  }
}

extension RecipeIngredientMapper on RecipeIngredientDto {
  RecipeIngredient toRecipeIngredient() {
    return RecipeIngredient(
      ingredient: ingredient?.toIngredient() ?? Ingredient(id: 0, name: '', image: ''),
      amount: amount ?? 0,
    );
  }
}

extension IngredientDtoMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(
      id: id ?? 0,
      name: name ?? '',
      image: image ?? '',
    );
  }
}

