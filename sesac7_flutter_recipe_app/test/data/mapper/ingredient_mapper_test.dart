
import 'package:flutter_recipe_app/data/dto/ingredient_dto.dart';
import 'package:flutter_recipe_app/data/mapper/ingredient_mapper.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IngredientMapper', () {
    test('IngredientDto toModel should return correct Ingredient model', () {
      final ingredientDto = IngredientDto(
        id: 1,
        name: 'Test Ingredient',
        image: 'test_image_url',
      );

      final ingredientModel = ingredientDto.toModel();

      expect(ingredientModel.id, 1);
      expect(ingredientModel.name, 'Test Ingredient');
      expect(ingredientModel.image, 'test_image_url');
    });

    test('IngredientModel toDto should return correct IngredientDto', () {
      final ingredientModel = Ingredient(
        id: 1,
        name: 'Test Ingredient',
        image: 'test_image_url',
      );

      final ingredientDto = ingredientModel.toDto();

      expect(ingredientDto.id, 1);
      expect(ingredientDto.name, 'Test Ingredient');
      expect(ingredientDto.image, 'test_image_url');
    });
  });
}
