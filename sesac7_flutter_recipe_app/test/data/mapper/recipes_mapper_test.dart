
import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipes_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipes_mapper.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/model/recipes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecipesMapper', () {
    final recipeDto = RecipeDto(
      category: 'Test Category',
      id: 1,
      name: 'Test Recipe',
      image: 'test.jpg',
      chef: 'Test Chef',
      time: '30min',
      rating: 4.5,
      ingredients: [],
    );
    final recipeModel = Recipe(
      category: 'Test Category',
      id: 1,
      name: 'Test Recipe',
      image: 'test.jpg',
      chef: 'Test Chef',
      time: '30min',
      rating: 4.5,
      ingredients: [],
    );

    test('RecipesDto toModel should return correct Recipes model', () {
      final recipesDto = RecipesDto(
        recipes: [recipeDto],
      );

      final recipesModel = recipesDto.toModel();

      expect(recipesModel.recipes.length, 1);
      expect(recipesModel.recipes[0].name, 'Test Recipe');
    });

    test('RecipesModel toDto should return correct RecipesDto', () {
      final recipesModel = Recipes(
        recipes: [recipeModel],
      );

      final recipesDto = recipesModel.toDto();

      expect(recipesDto.recipes?.length, 1);
      expect(recipesDto.recipes?[0].name, 'Test Recipe');
    });

    test('RecipesDto toModel should handle null recipes list', () {
      final recipesDto = RecipesDto(recipes: null);

      final recipesModel = recipesDto.toModel();

      expect(recipesModel.recipes, isEmpty);
    });
  });
}
