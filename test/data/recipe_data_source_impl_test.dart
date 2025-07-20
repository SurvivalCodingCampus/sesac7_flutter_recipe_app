import 'package:flutter_recipe_app/data/mocks/data_source/mock_recipe_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';

void main() {
  group('RecipeRepository 테스트', () {
    late MockRecipeDataSourceImpl mockDataSource;
    late RecipeRepositoryImpl recipeRepository;

    setUp(() {
      // 각 테스트 전에 Mock DataSource와 Repository를 새로 초기화
      mockDataSource = MockRecipeDataSourceImpl();
      recipeRepository = RecipeRepositoryImpl(dataSource: mockDataSource);
    });

    test('getRecipes 호출 시 레시피 목록을 성공적으로 가져와야 함', () async {
      final result = await recipeRepository.getRecipes();

      // 결과가 Success인지 확인
      expect(result, isA<Success<List<Recipe>, NetworkError>>());

      // 성공 시 데이터 확인
      result.when(
        success: (recipes) {
          expect(recipes, isA<List<Recipe>>());
          expect(recipes.length, 10); // 제공된 JSON 데이터의 레시피 수
          expect(recipes[0].id, 1);
          expect(recipes[0].name, 'Traditional spare ribs baked');
          expect(recipes[0].ingredients.length, 4);
          expect(recipes[0].ingredients[0].ingredient.name, 'Pork');
        },
        error: (error) {
          fail('레시피를 가져오는 데 실패했습니다: $error'); // 오류가 발생하면 테스트 실패
        },
      );
    });
  });
}