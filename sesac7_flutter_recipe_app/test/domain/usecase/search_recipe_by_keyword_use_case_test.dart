
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/search_recipe_by_keyword_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_recipe_repository.dart';

void main() {
  group('SearchRecipeByKeywordUseCase', () {
    test('should return success when repository returns success', () async {
      final recipeList = [
        Recipe(
            id: 1,
            name: 'test recipe',
            image: 'test_url',
            category: 'test',
            time: '10min',
            chef: 'test chef',
            rating: 5.0,
            ingredients: [],
        )
      ];
      final mockRepository = MockRecipeRepository(
        getRecipesResult: const Error(NetworkError.unKnown),
        searchRecipesResult: Success(recipeList),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = SearchRecipeByKeywordUseCase(recipeRepository: mockRepository);

      final result = await useCase.execute('test');

      expect(result, isA<Success>());
      expect((result as Success).data, recipeList);
    });

    test('should return error when repository returns error', () async {
      final mockRepository = MockRecipeRepository(
        getRecipesResult: const Error(NetworkError.unKnown),
        searchRecipesResult: Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = SearchRecipeByKeywordUseCase(recipeRepository: mockRepository);

      final result = await useCase.execute('test');

      expect(result, isA<Error>());
      expect((result as Error).error, NetworkError.unKnown);
    });
  });
}
