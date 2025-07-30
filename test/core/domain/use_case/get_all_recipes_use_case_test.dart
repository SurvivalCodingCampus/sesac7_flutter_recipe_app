import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/domain/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/core/domain/use_case/get_all_recipes_use_case.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_recipes_use_case_test.mocks.dart';

@GenerateMocks([RecipeRepository])
void main() {
  group('GetAllRecipesUseCase', () {
    late GetAllRecipesUseCase useCase;
    late MockRecipeRepository mockRecipeRepository;

    setUp(() {
      mockRecipeRepository = MockRecipeRepository();
      useCase = GetAllRecipesUseCase(recipeRepository: mockRecipeRepository);
    });

    final mockRecipes = [
      const Recipe(
        id: '1',
        name: 'Test Recipe 1',
        category: 'Test',
        creator: 'Tester',
        cookingTime: '10 min',
        rating: 5.0,
        imageUrl: 'http://example.com/image.jpg',
        imageWithoutBackground: 'http://example.com/image_no_bg.jpg',
        reviewCount: 10,
        serve: 2,
        isSaved: false,
      ),
    ];

    test(
        'Given repository returns recipes, ' 
        'When execute is called, ' 
        'Then it should return a success result with the recipes', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes()).thenAnswer(
        (_) async => mockRecipes,
      );

      // When
      final result = await useCase.execute();

      // Then
      expect(result, isA<Success<List<Recipe>, NetworkError>>());
      expect((result as Success).data, mockRecipes);
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    });

    test(
        'Given repository throws a NetworkError, ' 
        'When execute is called, ' 
        'Then it should return an error result with the same error', () async {
      // Given
      const networkError = NetworkError.serverError;
      when(mockRecipeRepository.fetchAllRecipes()).thenThrow(networkError);

      // When
      final result = await useCase.execute();

      // Then
      expect(result, isA<Error<List<Recipe>, NetworkError>>());
      expect((result as Error).error, networkError);
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    });

    test(
        'Given repository throws a TimeoutException, ' 
        'When execute is called, ' 
        'Then it should return a requestTimeout error', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes()).thenThrow(TimeoutException(''));

      // When
      final result = await useCase.execute();

      // Then
      expect(result, isA<Error<List<Recipe>, NetworkError>>());
      expect((result as Error).error, NetworkError.requestTimeout);
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    });

    test(
        'Given repository throws a FormatException, ' 
        'When execute is called, ' 
        'Then it should return a parseError', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes()).thenThrow(FormatException(''));

      // When
      final result = await useCase.execute();

      // Then
      expect(result, isA<Error<List<Recipe>, NetworkError>>());
      expect((result as Error).error, NetworkError.parseError);
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    });

    test(
        'Given repository throws an unknown exception, ' 
        'When execute is called, ' 
        'Then it should return an unknown error', () async {
      // Given
      when(mockRecipeRepository.fetchAllRecipes()).thenThrow(Exception(''));

      // When
      final result = await useCase.execute();

      // Then
      expect(result, isA<Error<List<Recipe>, NetworkError>>());
      expect((result as Error).error, NetworkError.unknown);
      verify(mockRecipeRepository.fetchAllRecipes()).called(1);
    });
  });
}