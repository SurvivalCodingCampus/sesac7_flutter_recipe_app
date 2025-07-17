import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/data/model/ingredient.dart';
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
      ingredients:
          ingredients?.map((ingredient) => ingredient as Ingredient).toList() ??
          [],
    );
  }
}
