
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_get_saved_recipes_use_case.dart';

void main() {
  group('GetSavedRecipeFindByIdUseCase', () {
    final savedRecipes = [
      Recipe(
          id: 1,
          name: 'Recipe A',
          image: 'urlA',
          category: 'Category1',
          time: '10min',
          chef: 'Chef A',
          rating: 4.0,
          ingredients: []),
      Recipe(
          id: 2,
          name: 'Recipe B',
          image: 'urlB',
          category: 'Category2',
          time: '20min',
          chef: 'Chef B',
          rating: 3.5,
          ingredients: []),
    ];

    test('should return recipe when found by id', () async {
      final mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(Success(savedRecipes));
      final useCase = GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase);

      final result = await useCase.execute(1);

      expect(result, isA<Success>());
      expect((result as Success).data?.id, 1);
    });

    test('should return null when recipe not found by id', () async {
      final mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(Success(savedRecipes));
      final useCase = GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase);

      final result = await useCase.execute(99);

      expect(result, isA<Success>());
      expect((result as Success).data, isNull);
    });

    test('should return error when GetSavedRecipesUseCase returns error', () async {
      final mockGetSavedRecipesUseCase = MockGetSavedRecipesUseCase(const Error('error'));
      final useCase = GetSavedRecipeFindByIdUseCase(getSavedRecipesUseCase: mockGetSavedRecipesUseCase);

      final result = await useCase.execute(1);

      expect(result, isA<Error>());
      expect((result as Error).error, 'error');
    });
  });
}
