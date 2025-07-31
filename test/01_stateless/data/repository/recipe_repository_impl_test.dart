import 'dart:convert';

import 'package:flutter_recipe_app/01_stateless/core/response.dart';
import 'package:flutter_recipe_app/01_stateless/core/result.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock/mocks.dart';
import 'recipe_repository_impl_test.mocks.dart';

// Mock 클래스 생성을 위한 어노테이션
@GenerateMocks([RecipeDataSource])
void main() {
  late RecipeDataSource mockRecipeDataSource;
  late RecipeRepository repository;

  // 각 테스트 전에 초기화
  setUp(() {
    mockRecipeDataSource = MockRecipeDataSource();
    repository = RecipeRepositoryImpl(recipeDataSource: mockRecipeDataSource);
  });

  group('MockRecipeRepositoryImpl', () {
    test('getRecipes는 성공적인 경우 Recipe 목록을 반환해야 한다', () async {
      // Given: RecipeDataSource가 성공적인 응답을 반환할 때
      when(
        mockRecipeDataSource.getRecipes(),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          header: {},
          body: jsonEncode(mockRecipesJson),
        ),
      );

      // When: getRecipes를 호출할 때
      final result = await repository.getRecipes();

      // Then: 결과는 성공이어야 하고 예상된 Recipe 목록을 포함해야 한다
      expect(result, isA<Result<List<Recipe>>>());
      expect(
        result.when(success: (data) => data, error: (message) => null),
        isNotNull,
      );

      switch (result) {
        case Success<List<Recipe>>():
          final recipes = result.data;
          expect(recipes.length, 10);
          expect(recipes[0].name, 'Traditional spare ribs baked');
          expect(recipes[1].name, 'Spice roasted chicken with flavored rice');
        case Error<List<Recipe>>():
          fail('Expected success, but got error: ${result.message}');
      }
    });

    test('getRecipes는 빈 Recipe 목록인 경우 에러를 반환해야 한다', () async {
      // Given: RecipeDataSource가 빈 응답을 반환할 때
      when(
        mockRecipeDataSource.getRecipes(),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          header: {},
          body: jsonEncode({"recipes": []}),
        ),
      );

      // When: getRecipes를 호출할 때
      final result = await repository.getRecipes();

      // Then: 결과는 에러여야 한다
      expect(result, isA<Result<List<Recipe>>>());

      switch (result) {
        case Success<List<Recipe>>():
          fail('Expected error, but got success with data: $result');

        case Error<List<Recipe>>():
          expect(result.message, 'No recipes found');
      }
    });

    test('getRecipes는 DataSource 호출 실패 시 에러를 반환해야 한다', () async {
      // Given: RecipeDataSource 호출이 예외를 발생시킬 때
      when(
        mockRecipeDataSource.getRecipes(),
      ).thenThrow(Exception('Network error'));

      // When: getRecipes를 호출할 때
      final result = await repository.getRecipes();

      // Then: 결과는 에러여야 한다
      expect(result, isA<Result<List<Recipe>>>());

      switch (result) {
        case Success<List<Recipe>>():
          fail('Expected error, but got success with data: $result');

        case Error<List<Recipe>>():
          expect(result.message, 'Failed to fetch recipes');
      }
    });

    test('getRecipes는 잘못된 JSON 응답 시 에러를 반환해야 한다', () async {
      // Given: RecipeDataSource가 잘못된 JSON 응답을 반환할 때
      when(
        mockRecipeDataSource.getRecipes(),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          header: {},
          body: '{"recipes": [invalid json]}',
        ),
      );

      // When: getRecipes를 호출할 때
      final result = await repository.getRecipes();

      // Then: 결과는 에러여야 한다
      expect(result, isA<Result<List<Recipe>>>());

      switch (result) {
        case Success<List<Recipe>>():
          fail('Expected error, but got success with data: $result');

        case Error<List<Recipe>>():
          expect(result.message, 'Failed to fetch recipes');
      }
    });
  });
}
