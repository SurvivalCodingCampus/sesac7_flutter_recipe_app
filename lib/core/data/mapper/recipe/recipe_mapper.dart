import 'package:flutter_recipe_app/core/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';

extension RecipeDtoToModel on RecipeDto {
  Recipe toModel() {
    return Recipe(
      id: _initId(id),
      category: category ?? '',
      name: name ?? '',
      imageUrl: image ?? '',
      creator: chef ?? '',
      cookingTime: time ?? '',
      rating: rating ?? 0,
      reviewCount: 0,
      serve: 0,
    );
  }

  String _initId(int? id) {
    return id?.toString() ?? Recipe.invalidId;
  }
}

extension RecipeModelToDto on Recipe {
  RecipeDto toDto() {
    return RecipeDto(
      id: int.tryParse(id) ?? -1,
      category: category,
      name: name,
      image: imageUrl,
      chef: creator,
      time: cookingTime,
      rating: rating,
    );
  }
}
