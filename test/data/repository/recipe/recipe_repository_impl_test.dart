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
    test('성공 케이스: 정상적인 데이터를 수신했을 때', () async {
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
      expect(
        result.when(success: (data) => data, error: (_) => null),
        isNotNull,
      );
      expect(
        result.when(success: (data) => data, error: (_) => null)?.length,
        2,
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('실패 케이스: 네트워크 오류 (TimeoutException)', () async {
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

    test('실패 케이스: 데이터 파싱 오류 (FormatException)', () async {
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

    test('실패 케이스: 알 수 없는 오류', () async {
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

    test('실패 케이스: HTTP 상태 코드 오류', () async {
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

    test('엣지 케이스: 빈 데이터 리스트를 수신했을 때', () async {
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
      expect(
        result.when(success: (data) => data, error: (_) => null),
        isNotNull,
      );
      expect(
        result.when(success: (data) => data, error: (_) => null)?.isEmpty,
        isTrue,
      );
      verify(mockDataSource.fetchAllRecipes()).called(1);
    });

    test('엣지 케이스: 유효하지 않은 ID를 포함하는 데이터를 필터링하는지 검증', () async {
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
    });
  });
}
