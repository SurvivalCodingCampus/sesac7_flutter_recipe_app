
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_recipe_repository.dart';

void main() {
  group('GetRecipesUseCase', () {
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
        getRecipesResult: Success(recipeList),
        searchRecipesResult: const Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = GetRecipesUseCase(recipeRepository: mockRepository);

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, recipeList);
    });

    test('should return error when repository returns error', () async {
      final mockRepository = MockRecipeRepository(
        getRecipesResult: Error(NetworkError.unKnown),
        searchRecipesResult: const Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = GetRecipesUseCase(recipeRepository: mockRepository);

      final result = await useCase.execute();

      expect(result, isA<Error>());
      expect((result as Error).error, NetworkError.unKnown);
    });
  });
}
