import 'package:flutter_recipe_app/data/dto/recipes_response_dto.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/model/ingredient.dart';

extension RecipesDtoToModel on RecipesResponseDto {
  List<Recipe> toRecipes() {
    if (recipes == null) return [];

    return recipes!.map((recipe) => recipe.toRecipe()).toList();
  }
}

extension RecipeDtoToModel on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      category: category ?? '',
      id: id != null ? id!.toInt() : 0,
      name: name ?? '',
      imgSrc: image ?? '',
      chef: chef ?? '',
      time: time == null ? 0 : int.tryParse(time!) ?? 0,
      rating: rating != null ? rating!.toInt() : 0,
      ingredients: ingredients != null
          ? ingredients!.map((e) => e.toIngredient()).toList()
          : [],
    );
  }
}

extension IngredientDtoToModel on Ingredients {
  Ingredient toIngredient() {
    return Ingredient(
      id: ingredient?.id != null ? ingredient!.id!.toInt() : 0,
      name: ingredient?.name ?? '',
      imgSrc: ingredient?.imgSrc ?? '',
      amount: amount != null ? amount!.toInt() : 0,
    );
  }
}
