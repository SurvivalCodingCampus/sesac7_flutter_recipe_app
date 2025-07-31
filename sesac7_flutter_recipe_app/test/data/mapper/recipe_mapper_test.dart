
import 'package:flutter_recipe_app/data/dto/ingredient_dto.dart';
import 'package:flutter_recipe_app/data/dto/ingredients_dto.dart';
import 'package:flutter_recipe_app/data/dto/recipe_dto.dart';
import 'package:flutter_recipe_app/data/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecipeMapper', () {
    final ingredientDto = IngredientDto(id: 1, name: 'Onion', image: 'onion.jpg');
    final ingredientsDto = IngredientsDto(ingredient: ingredientDto, amount: 100);
    final ingredientModel = Ingredient(id: 1, name: 'Onion', image: 'onion.jpg');
    final ingredientsModel = Ingredients(ingredient: ingredientModel, amount: 100);

    test('RecipeDto toModel should return correct Recipe model', () {
      final recipeDto = RecipeDto(
        category: 'Test Category',
        id: 1,
        name: 'Test Recipe',
        image: 'test.jpg',
        chef: 'Test Chef',
        time: '30min',
        rating: 4.5,
        ingredients: [ingredientsDto],
      );

      final recipeModel = recipeDto.toModel();

      expect(recipeModel.category, 'Test Category');
      expect(recipeModel.id, 1);
      expect(recipeModel.name, 'Test Recipe');
      expect(recipeModel.image, 'test.jpg');
      expect(recipeModel.chef, 'Test Chef');
      expect(recipeModel.time, '30min');
      expect(recipeModel.rating, 4.5);
      expect(recipeModel.ingredients.length, 1);
      expect(recipeModel.ingredients[0].ingredient.name, 'Onion');
    });

    test('RecipeModel toDto should return correct RecipeDto', () {
      final recipeModel = Recipe(
        category: 'Test Category',
        id: 1,
        name: 'Test Recipe',
        image: 'test.jpg',
        chef: 'Test Chef',
        time: '30min',
        rating: 4.5,
        ingredients: [ingredientsModel],
      );

      final recipeDto = recipeModel.toDto();

      expect(recipeDto.category, 'Test Category');
      expect(recipeDto.id, 1);
      expect(recipeDto.name, 'Test Recipe');
      expect(recipeDto.image, 'test.jpg');
      expect(recipeDto.chef, 'Test Chef');
      expect(recipeDto.time, '30min');
      expect(recipeDto.rating, 4.5);
      expect(recipeDto.ingredients?.length, 1);
      expect(recipeDto.ingredients?[0].ingredient?.name, 'Onion');
    });

    test('RecipeDto toModel should handle null ingredients list', () {
      final recipeDto = RecipeDto(
        category: 'Test Category',
        id: 1,
        name: 'Test Recipe',
        image: 'test.jpg',
        chef: 'Test Chef',
        time: '30min',
        rating: 4.5,
        ingredients: null,
      );

      final recipeModel = recipeDto.toModel();

      expect(recipeModel.ingredients, isEmpty);
    });
  });
}
