
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_category_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_get_recipes_use_case.dart';

void main() {
  group('GetRecipesCategoryListUseCase', () {
    test('should return unique categories when successful', () async {
      final recipeList = [
        Recipe(
            id: 1,
            name: 'Recipe A',
            image: 'urlA',
            category: 'Category1',
            time: '10min',
            chef: 'Chef A',
            rating: 4.0,
            ingredients: []),
        Recipe(
            id: 2,
            name: 'Recipe B',
            image: 'urlB',
            category: 'Category2',
            time: '20min',
            chef: 'Chef B',
            rating: 3.5,
            ingredients: []),
        Recipe(
            id: 3,
            name: 'Recipe C',
            image: 'urlC',
            category: 'Category1',
            time: '15min',
            chef: 'Chef C',
            rating: 4.5,
            ingredients: []),
      ];
      final mockGetRecipesUseCase = MockGetRecipesUseCase(Success(recipeList));
      final useCase = GetRecipesCategoryListUseCase(getRecipesUseCase: mockGetRecipesUseCase);

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, {'Category1', 'Category2'});
    });

    test('should return empty set when no recipes are available', () async {
      final mockGetRecipesUseCase = MockGetRecipesUseCase(const Success([]));
      final useCase = GetRecipesCategoryListUseCase(getRecipesUseCase: mockGetRecipesUseCase);

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, isEmpty);
    });

    test('should return error when GetRecipesUseCase returns error', () async {
      final mockGetRecipesUseCase = MockGetRecipesUseCase(Error(NetworkError.unKnown));
      final useCase = GetRecipesCategoryListUseCase(getRecipesUseCase: mockGetRecipesUseCase);

      final result = await useCase.execute();

      expect(result, isA<Error>());
      expect((result as Error).error, NetworkError.unKnown);
    });
  });
}
