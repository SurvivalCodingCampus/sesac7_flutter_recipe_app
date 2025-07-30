import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recipe_use_case_test.mocks.dart';

@GenerateMocks([RecipeRepository])
void main() {
  group('GetRecipeUseCase', () {
    late GetRecipeUseCase useCase;
    late MockRecipeRepository mockRecipeRepository;

    setUp(() {
      mockRecipeRepository = MockRecipeRepository();
      useCase = GetRecipeUseCase(recipeRepository: mockRecipeRepository);
    });

    final mockRecipes = [
      const Recipe(
        id: '1',
        name: 'Pasta',
        category: 'Italian',
        isSaved: false,
        creator: '',
        cookingTime: '',
        rating: 0,
        reviewCount: 0,
        serve: 0,
        imageUrl: '',
        imageWithoutBackground: '',
      ),
      const Recipe(
        id: '2',
        name: 'Curry',
        category: 'Indian',
        isSaved: false,
        creator: '',
        cookingTime: '',
        rating: 0,
        reviewCount: 0,
        serve: 0,
        imageUrl: '',
        imageWithoutBackground: '',
      ),
    ];

    test('Given repository returns recipes, '
        'When execute is called with a valid ID, '
        'Then it should return the correct recipe', () async {
      // Given
      when(
        mockRecipeRepository.fetchAllRecipes(),
      ).thenAnswer((_) async => mockRecipes);
      const recipeId = '1';

      // When
      final result = await useCase.execute(recipeId);

      // Then
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
      expect(result, isA<Success<Recipe, NetworkError>>());
      expect((result as Success).data.id, recipeId);
      expect((result as Success).data.name, 'Pasta');
    });

    test('Given repository returns recipes, '
        'When execute is called with an invalid ID, '
        'Then it should return an unknown error', () async {
      // Given
      when(
        mockRecipeRepository.fetchAllRecipes(),
      ).thenAnswer((_) async => mockRecipes);
      const recipeId = '3'; // This ID does not exist

      // When
      final result = await useCase.execute(recipeId);

      // Then
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
      expect(result, isA<Error<Recipe, NetworkError>>());
      expect((result as Error).error, NetworkError.unknown);
    });

    void testExceptionHandling(
      Exception thrownException,
      NetworkError expectedError,
    ) {
      test('Given repository throws ${thrownException.runtimeType}, '
          'When execute is called, '
          'Then it should return a ${expectedError.name} error', () async {
        // Given
        when(mockRecipeRepository.fetchAllRecipes()).thenThrow(thrownException);

        // When
        final result = await useCase.execute('any-id');

        // Then
        verify(mockRecipeRepository.fetchAllRecipes()).called(1);
        expect(result, isA<Error<Recipe, NetworkError>>());
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
