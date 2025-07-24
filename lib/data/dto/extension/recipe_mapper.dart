


import '../../../domain/model/ingredient.dart';
import '../../../domain/model/recipe.dart';
import '../../../domain/model/recipe_ingredient.dart';
import '../../../domain/model/step_Info.dart';
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
      isSaved: isSaved ?? false,
      ingredients: ingredients?.map((e) => e.toRecipeIngredient()).toList() ?? [],
      steps: steps?.map((e) => e.toStepInfo()).toList() ?? [],
    );

  }
}

extension RecipeStepInfoMapper on StepInfoDto {
  StepInfo toStepInfo() {
    return StepInfo(
      stepNumber: stepNumber?.toInt() ?? 0,
      description: description ?? '',
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

