
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_recipes_by_category.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_get_recipes_use_case.dart';

void main() {
  group('GetRecipesByCategory', () {
    final allRecipes = [
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

    test('should return recipes filtered by category when successful', () async {
      final mockGetRecipesUseCase = MockGetRecipesUseCase(Success(allRecipes));
      final useCase = GetRecipesByCategory(getRecipesUseCase: mockGetRecipesUseCase);

      final result = await useCase.execute('Category1');

      expect(result, isA<Success>());
      expect((result as Success).data.length, 2);
      expect((result as Success).data[0].name, 'Recipe A');
      expect((result as Success).data[1].name, 'Recipe C');
    });

    test('should return empty list if no recipes match the category', () async {
      final mockGetRecipesUseCase = MockGetRecipesUseCase(Success(allRecipes));
      final useCase = GetRecipesByCategory(getRecipesUseCase: mockGetRecipesUseCase);

      final result = await useCase.execute('NonExistentCategory');

      expect(result, isA<Success>());
      expect((result as Success).data, isEmpty);
    });

    test('should return error when GetRecipesUseCase returns error', () async {
      final mockGetRecipesUseCase = MockGetRecipesUseCase(Error(NetworkError.unKnown));
      final useCase = GetRecipesByCategory(getRecipesUseCase: mockGetRecipesUseCase);

      final result = await useCase.execute('Category1');

      expect(result, isA<Error>());
      expect((result as Error).error, NetworkError.unKnown);
    });
  });
}
