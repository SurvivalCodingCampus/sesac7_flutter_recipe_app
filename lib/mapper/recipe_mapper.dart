import '../dto/recipe_dto.dart';
import '../model/recipe.dart' as model;
import '../mapper/ingredient_mapper.dart';

extension RecipesMapper on Recipes {
  model.Recipe toModel() {
    return model.Recipe(
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
