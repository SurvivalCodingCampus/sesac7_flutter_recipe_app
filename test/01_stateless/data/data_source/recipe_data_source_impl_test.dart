import 'dart:convert';

import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

import '../mock/mocks.dart'; // mockRecipesJson이 정의된 파일

void main() {
  group('RecipeDataSourceImpl', () {
    test('성공 - 200 OK와 올바른 레시피 데이터를 반환해야 한다', () async {
      // Given: MockClient가 성공적인 응답 (200 OK)을 반환하도록 설정
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode(mockRecipesJson), 200);
      });

      final RecipeDataSource recipeDataSource = RecipeDataSourceImpl(
        client: mockClient,
      );

      // When: getRecipes 메소드를 호출할 때
      final response = await recipeDataSource.getRecipes();

      // Then: 응답 상태 코드가 200이고, 본문이 예상된 JSON과 일치해야 한다
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(mockRecipesJson));
    });

    test('실패 - 네트워크 오류 시 예외를 던지거나 적절한 에러 응답을 반환해야 한다', () async {
      // Given: MockClient가 네트워크 오류 상황을 시뮬레이션 (예: Connection refused)
      // 여기서는 500 Internal Server Error로 가정하여 일반적인 서버 오류를 테스트
      final mockClient = MockClient((request) async {
        return http.Response('Server Error', 500);
      });

      final RecipeDataSource recipeDataSource = RecipeDataSourceImpl(
        client: mockClient,
      );

      // When: getRecipes 메소드를 호출할 때
      final response = await recipeDataSource.getRecipes();

      // Then: 응답 상태 코드가 500이고, 본문에 에러 메시지가 포함되어야 한다
      expect(response.statusCode, 500);
      expect(response.body, 'Server Error');
    });

    test('실패 - 404 Not Found 시나리오를 처리해야 한다', () async {
      // Given: MockClient가 404 Not Found 응답을 반환하도록 설정
      final mockClient = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      final RecipeDataSource recipeDataSource = RecipeDataSourceImpl(
        client: mockClient,
      );

      // When: getRecipes 메소드를 호출할 때
      final response = await recipeDataSource.getRecipes();

      // Then: 응답 상태 코드가 404이고, 본문에 'Not Found' 메시지가 포함되어야 한다
      expect(response.statusCode, 404);
      expect(response.body, 'Not Found');
    });

    test('성공 - 응답 본문이 비어 있을 때 (빈 배열)를 처리해야 한다', () async {
      // Given: MockClient가 빈 레시피 배열을 포함하는 200 OK 응답을 반환하도록 설정
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({"recipes": []}), 200);
      });

      final RecipeDataSource recipeDataSource = RecipeDataSourceImpl(
        client: mockClient,
      );

      // When: getRecipes 메소드를 호출할 때
      final response = await recipeDataSource.getRecipes();

      // Then: 응답 상태 코드가 200이고, 본문에 빈 레시피 배열이 포함되어야 한다
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode({"recipes": []}));
    });

    test('실패 - 잘못된 JSON 응답을 처리해야 한다', () async {
      // Given: MockClient가 유효하지 않은 JSON 응답을 반환하도록 설정
      final mockClient = MockClient((request) async {
        return http.Response(
          'This is not a valid JSON',
          200,
        ); // 상태 코드는 200이지만 본문이 JSON이 아님
      });

      final RecipeDataSource recipeDataSource = RecipeDataSourceImpl(
        client: mockClient,
      );

      // When: getRecipes 메소드를 호출할 때
      final response = await recipeDataSource.getRecipes();

      // Then: DataSource 레벨에서는 단순히 받은 응답을 반환하므로, 상태 코드와 본문이 그대로 와야 한다.
      // JSON 파싱 오류는 상위 레포지토리 계층에서 처리될 것이다.
      expect(response.statusCode, 200);
      expect(response.body, 'This is not a valid JSON');
    });
  });
}
