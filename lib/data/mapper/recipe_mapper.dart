import '../dto/recipe_dto.dart';
import '../model/recipe.dart';
import 'ingredient_mapper.dart';

extension RecipesMapper on Recipes {
  Recipe toModel() {
    return Recipe(
      category: category ?? '',
      id: id ?? 0,
      name: name ?? '',
      image: image ?? '',
      chef: chef ?? '',
      time: time ?? '',
      rating: (rating ?? 0).toDouble(),
      ingredients: ingredients?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}
