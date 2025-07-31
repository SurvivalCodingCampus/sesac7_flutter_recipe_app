import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/ingredient_repository.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_all_ingredients_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_ingredients_use_case_test.mocks.dart';

@GenerateMocks([IngredientRepository])
void main() {
  group('GetAllIngredientsUseCase', () {
    late GetAllIngredientsUseCase useCase;
    late MockIngredientRepository mockIngredientRepository;

    setUp(() {
      mockIngredientRepository = MockIngredientRepository();
      useCase = GetAllIngredientsUseCase(
        ingredientRepository: mockIngredientRepository,
      );
    });

    const recipeId = 'recipe-1';
    final mockIngredients = [
      const Ingredient(id: '1', name: 'Flour', imageUrl: '', weight: 500),
      const Ingredient(id: '2', name: 'Sugar', imageUrl: '', weight: 200),
    ];

    test(
      'Given the repository returns ingredients, '
      'When execute is called, '
      'Then it should return a success result with the ingredients',
      () async {
        // Given
        when(
          mockIngredientRepository.fetchAllIngredient(any),
        ).thenAnswer((_) async => mockIngredients);

        // When
        final result = await useCase.execute(recipeId);

        // Then
        verify(mockIngredientRepository.fetchAllIngredient(recipeId)).called(1);
        expect(result, isA<Success<List<Ingredient>, NetworkError>>());
        expect((result as Success).data, mockIngredients);
      },
    );

    void testExceptionHandling(
      Exception thrownException,
      NetworkError expectedError,
    ) {
      test('Given repository throws ${thrownException.runtimeType}, '
          'When execute is called, '
          'Then it should return a ${expectedError.name} error', () async {
        // Given
        when(
          mockIngredientRepository.fetchAllIngredient(any),
        ).thenThrow(thrownException);

        // When
        final result = await useCase.execute(recipeId);

        // Then
        verify(mockIngredientRepository.fetchAllIngredient(recipeId)).called(1);
        expect(result, isA<Error<List<Ingredient>, NetworkError>>());
        expect((result as Error).error, expectedError);
      });
    }

    testExceptionHandling(
      TimeoutException('Request timed out'),
      NetworkError.requestTimeout,
    );
    testExceptionHandling(
      FormatException('Invalid format'),
      NetworkError.parseError,
    );
    testExceptionHandling(Exception('Unknown error'), NetworkError.unknown);
  });
}
