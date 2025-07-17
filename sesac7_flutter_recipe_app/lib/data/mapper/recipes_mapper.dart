import 'package:flutter_recipe_app/data/dto/recipes_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/model/recipes.dart';

extension RecipesDtoToModel on RecipesDto {
  Recipes toModel() {
    return Recipes(
      recipes: recipes?.map((recipe) => recipe.toModel()).toList() ?? [],
    );
  }
}

extension RecipesModelToDto on Recipes {
  RecipesDto toDto() {
    return RecipesDto(
      recipes: recipes.map((model) => model.toDto()).toList(),
    );
  }
}
