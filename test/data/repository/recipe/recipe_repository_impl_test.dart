import 'dart:async';

import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/response.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'recipe_repository_impl_test.mocks.dart';

@GenerateMocks([RecipeDataSource])
void main() {
  final mockDataSource = MockRecipeDataSource();
  final repository = RecipeRepositoryImpl(recipeDataSource: mockDataSource);

  group('fetchAllRecipes', () {
    test('should return success when receiving valid data', () async {
      // Arrange
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

      // Act
      final result = await repository.fetchAllRecipes();

      // Assert
      expect(result, isA<Result<List<Recipe>, NetworkError>>());
      result.when(
        success: (List<Recipe> data) {
          expect(data.length, 2);
          expect(data[0].name, 'Test Recipe 1');
          expect(data[1].name, 'Test Recipe 2');
        },
        error: (NetworkError error) {
          fail('Expected success but got error: $error');
        },
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('Failure Case: Network Error (TimeoutException)', () async {
      // Arrange
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenThrow(TimeoutException('Timeout'));

      // Act
      final result = await repository.fetchAllRecipes();

      // Assert
      expect(result, isA<Result<List<Recipe>, NetworkError>>());
      expect(
        result.when(success: (_) => null, error: (e) => e),
        NetworkError.requestTimeout,
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('Failure case: Data parsing error (FormatException)', () async {
      // Arrange
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenThrow(FormatException('Invalid format'));

      // Act
      final result = await repository.fetchAllRecipes();

      // Assert
      expect(result, isA<Result<List<Recipe>, NetworkError>>());
      expect(
        result.when(success: (_) => null, error: (e) => e),
        NetworkError.parseError,
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('Failure case: unknown error', () async {
      // Arrange
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenThrow(Exception('Unknown error'));

      // Act
      final result = await repository.fetchAllRecipes();

      // Assert
      expect(result, isA<Result<List<Recipe>, NetworkError>>());
      expect(
        result.when(success: (_) => null, error: (e) => e),
        NetworkError.unknown,
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('Failure case: HTTP status code error', () async {
      // Arrange
      final mockResponse = Response<List<RecipeDto>>(
        statusCode: 404,
        headers: {},
        body: [],
      );
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.fetchAllRecipes();

      // Assert
      expect(result, isA<Result<List<Recipe>, NetworkError>>());
      expect(
        result.when(success: (_) => null, error: (e) => e),
        NetworkError.notFound,
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('Edge case: when an empty list is received', () async {
      // Arrange
      final mockResponse = Response<List<RecipeDto>>(
        statusCode: 200,
        headers: {},
        body: [],
      );
      when(
        mockDataSource.fetchAllRecipes(),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.fetchAllRecipes();

      // Assert
      expect(result, isA<Result<List<Recipe>, NetworkError>>());
      result.when(
        success: (List<Recipe> data) {
          expect(data, isEmpty);
        },
        error: (NetworkError error) {
          fail('Expected success but got error: $error');
        },
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test(
      'Edge case: verifies that data with an invalid ID is filtered',
      () async {
        // Arrange
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

        // Act
        final result = await repository.fetchAllRecipes();

        // Assert
        expect(result, isA<Result<List<Recipe>, NetworkError>>());
        final successData = result.when(
          success: (data) => data,
          error: (_) => null,
        );
        expect(successData, isNotNull);
        expect(successData?.length, 1);
        expect(successData?.first.name, 'Valid Recipe');
        verify(mockDataSource.fetchAllRecipes()).called(1);
      },
    );
  });
}
