
import 'package:flutter_recipe_app/data/dto/ingredient_dto.dart';
import 'package:flutter_recipe_app/data/dto/ingredients_dto.dart';
import 'package:flutter_recipe_app/data/mapper/ingredients_mapper.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/domain/model/ingredients.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IngredientsMapper', () {
    test('IngredientsDto toModel should return correct Ingredients model', () {
      final ingredientsDto = IngredientsDto(
        ingredient: IngredientDto(
          id: 1,
          name: 'Test Ingredient',
          image: 'test_image_url',
        ),
        amount: 100,
      );

      final ingredientsModel = ingredientsDto.toModel();

      expect(ingredientsModel.ingredient.id, 1);
      expect(ingredientsModel.ingredient.name, 'Test Ingredient');
      expect(ingredientsModel.ingredient.image, 'test_image_url');
      expect(ingredientsModel.amount, 100);
    });

    test('IngredientsModel toDto should return correct IngredientsDto', () {
      final ingredientsModel = Ingredients(
        ingredient: Ingredient(
          id: 1,
          name: 'Test Ingredient',
          image: 'test_image_url',
        ),
        amount: 100,
      );

      final ingredientsDto = ingredientsModel.toDto();

      expect(ingredientsDto.ingredient?.id, 1);
      expect(ingredientsDto.ingredient?.name, 'Test Ingredient');
      expect(ingredientsDto.ingredient?.image, 'test_image_url');
      expect(ingredientsDto.amount, 100);
    });
  });
}
