import 'dart:async';

import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/response.dart';
import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/core/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'recipe_repository_impl_test.mocks.dart';

@GenerateMocks([RecipeDataSource])
void main() {
  final mockDataSource = MockRecipeDataSource();
  final repository = RecipeRepositoryImpl(recipeDataSource: mockDataSource);

  group('fetchAllRecipes', () {
    test(
      'should return a list of recipes when the call is successful',
      () async {
        // Given
        final mockResponse = Response(
          statusCode: 200,
          headers: {},
          body: [
            RecipeDto(id: 1, name: 'Test Recipe 1'),
            RecipeDto(id: 2, name: 'Test Recipe 2'),
          ],
        );
        when(
          mockDataSource.fetchAllRecipes(),
        ).thenAnswer((_) async => mockResponse);

        // When
        final result = await repository.fetchAllRecipes();

        // Then
        expect(result, isA<List<Recipe>>());
        expect(result.length, 2);
        expect(result[0].name, 'Test Recipe 1');
        expect(result[1].name, 'Test Recipe 2');
        verify(mockDataSource.fetchAllRecipes()).called(1);
      },
    );

    test(
      'should throw a TimeoutException when the data source times out',
      () async {
        // Given
        when(
          mockDataSource.fetchAllRecipes(),
        ).thenThrow(TimeoutException('Timeout'));

        // When & Then
        expect(
          () => repository.fetchAllRecipes(),
          throwsA(isA<TimeoutException>()),
        );
        verify(mockDataSource.fetchAllRecipes()).called(1);
      },
    );

    test('should throw a FormatException on data parsing error', () async {
      // Given
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenThrow(FormatException('Invalid format'));

      // When & Then
      expect(
        () => repository.fetchAllRecipes(),
        throwsA(isA<FormatException>()),
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('should rethrow an unknown exception from the data source', () async {
      // Given
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenThrow(Exception('Unknown error'));

      // When & Then
      expect(
        () => repository.fetchAllRecipes(),
        throwsA(isA<Exception>()),
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('should throw a NetworkError on HTTP status code error', () async {
      // Given
      final mockResponse = Response<List<RecipeDto>>(
        statusCode: 404,
        headers: {},
        body: [],
      );
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenAnswer((_) async => mockResponse);

      // When & Then
      expect(
        () => repository.fetchAllRecipes(),
        throwsA(isA<NetworkError>()),
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test(
      'should return an empty list when the data source returns an empty list',
      () async {
        // Given
        final mockResponse = Response<List<RecipeDto>>(
          statusCode: 200,
          headers: {},
          body: [],
        );
        when(
          mockDataSource.fetchAllRecipes(),
        ).thenAnswer((_) async => mockResponse);

        // When
        final result = await repository.fetchAllRecipes();

        // Then
        expect(result, isA<List<Recipe>>());
        expect(result, isEmpty);
        verify(mockDataSource.fetchAllRecipes()).called(1);
      },
    );

    test(
      'should filter out recipes with invalid IDs',
      () async {
        // Given
        final mockResponse = Response(
          statusCode: 200,
          headers: {},
          body: [
            RecipeDto(id: 1, name: 'Valid Recipe'),
            RecipeDto(id: null, name: 'Invalid Recipe'),
          ],
        );
        when(
          mockDataSource.fetchAllRecipes(),
        ).thenAnswer((_) async => mockResponse);

        // When
        final result = await repository.fetchAllRecipes();

        // Then
        expect(result, isA<List<Recipe>>());
        expect(result.length, 1);
        expect(result.first.name, 'Valid Recipe');
        verify(mockDataSource.fetchAllRecipes()).called(1);
      },
    );
  });
}
