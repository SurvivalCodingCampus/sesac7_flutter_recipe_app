import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/recipe_dto/recipe_dto.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      name: name ?? '',
      imageUrl: image ?? '',
      chef: chef ?? '',
      cookingTime: time ?? '',
      rating: rating?.toDouble() ?? -1.0,
      onChangeFavorite: () {},
    );
  }
}

// class Recipe {
//   Recipe({
//     this.category,
//     this.id,
//     this.name,
//     this.image,
//     this.chef,
//     this.time,
//     this.rating,
//     this.ingredients,});
