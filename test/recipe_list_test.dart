import 'dart:convert';

import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data_source/mock_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/repository/recipe_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  late RecipeRepositoryImpl recipeRepository;
  late MockRecipeDataSource mockRecipeDataSource; // 직접 구현한 Mock 사용

  setUp(() {
    mockRecipeDataSource = MockRecipeDataSource();
    recipeRepository = RecipeRepositoryImpl(mockRecipeDataSource); // 의존성 주입
  });

  group('RecipeRepositoryImpl, MockRecipeDataSource 테스트', () {
    test(
        'getRecipes는 MockRecipeDataSource로부터 성공적인 데이터를 받아 List<Recipe>로 변환해야 한다',
            () async {
          // Arrange (MockRecipeDataSource는 이미 고정된 응답을 반환하도록 설정되어 있음)
          // 별도의 when 설정이 필요 없음.

          // Act
          final result = await recipeRepository.getRecipes();

          // Assert
          // 1. 응답이 성공적인지 확인
          expect(result.isSuccess, isTrue);
          expect(result.errorMessage, isNull);
          expect(result.body, isNotNull);

          // 2. 반환된 데이터(List<Recipe>)가 비어있지 않은지 확인
          expect(result.body, isNotEmpty);

          // 3. 반환된 데이터의 타입이 List<Recipe>인지 확인 (선택적이지만, 타입 안정성 위해 좋음)
          expect(result.body, isA<List<Recipe>>());

          // 4. 첫 번째 레시피의 내용이 Mock 데이터와 일치하는지 간단히 확인
          //    (모든 필드를 검사할 수도 있고, 주요 필드만 검사할 수도 있습니다)
          if (result.body!.isNotEmpty) {
            final firstRecipeFromMock = (jsonDecode(
                (await mockRecipeDataSource.getRecipes()).body!)['recipes']
            as List)[0];
            final firstRecipeFromResult = result.body![0];

            expect(firstRecipeFromResult.id, firstRecipeFromMock['id']); // ID 타입 일치 주의
            expect(firstRecipeFromResult.name, firstRecipeFromMock['name']);
            expect(firstRecipeFromResult.category, firstRecipeFromMock['category']);
            // Recipe 모델에 id 필드가 int인지 String인지에 따라 toString() 필요 여부 결정

            // 예를 들어, Mock 데이터의 첫 번째 레시피 name: "Traditional spare ribs baked"
            expect(result.body![0].name, "Traditional spare ribs baked");
            expect(result.body![0].id, 1); // 또는 1 (int) - Recipe 모델의 id 타입에 따라
          }

          // 5. 예상되는 레시피 개수 확인
          final expectedRecipeCount = (jsonDecode(
              (await mockRecipeDataSource.getRecipes()).body!)['recipes'] as List)
              .length;
          expect(result.body!.length, expectedRecipeCount);
        });

    test('getRecipes 호출 시 DataSource의 getRecipes가 http.Response를 반환하는지 확인 (내부 동작 검증)',
            () async {

          final httpResponse = await mockRecipeDataSource.getRecipes(); // 직접 호출

          // Assert
          expect(httpResponse, isA<http.Response>());
          expect(httpResponse.statusCode, 200);
          expect(httpResponse.body, isNotEmpty);

          final decodedBody = jsonDecode(httpResponse.body!);
          expect(decodedBody, contains('recipes'));
          expect(decodedBody['recipes'], isA<List>());
        });
  });
}