
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';
import '../../mock/mock_recipe_repository.dart';

void main() {
  group('GetSavedRecipesUseCase', () {
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

    test('should return saved recipes when both repositories return success', () async {
      final mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Success(null),
        getIdsResult: const Success([1, 3]),
        bookmarkChangedStream: Stream.empty(),
      );
      final mockRecipeRepository = MockRecipeRepository(
        getRecipesResult: Success(allRecipes),
        searchRecipesResult: const Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = GetSavedRecipesUseCase(
        bookmarkRepository: mockBookmarkRepository,
        recipeRepository: mockRecipeRepository,
      );

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data.length, 2);
      expect((result as Success).data[0].id, 1);
      expect((result as Success).data[1].id, 3);
    });

    test('should return error when recipe repository returns error', () async {
      final mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Success(null),
        getIdsResult: const Success([1, 3]),
        bookmarkChangedStream: Stream.empty(),
      );
      final mockRecipeRepository = MockRecipeRepository(
        getRecipesResult: Error(NetworkError.unKnown),
        searchRecipesResult: const Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = GetSavedRecipesUseCase(
        bookmarkRepository: mockBookmarkRepository,
        recipeRepository: mockRecipeRepository,
      );

      final result = await useCase.execute();

      expect(result, isA<Error>());
      expect((result as Error).error, '전체 레시피가 없습니다.');
    });

    test('should return empty list when bookmark repository returns error', () async {
      final mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Success(null),
        getIdsResult: const Error('error'),
        bookmarkChangedStream: Stream.empty(),
      );
      final mockRecipeRepository = MockRecipeRepository(
        getRecipesResult: Success(allRecipes),
        searchRecipesResult: const Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = GetSavedRecipesUseCase(
        bookmarkRepository: mockBookmarkRepository,
        recipeRepository: mockRecipeRepository,
      );

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, isEmpty);
    });

    test('should return error when both repositories return error', () async {
      final mockBookmarkRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Success(null),
        getIdsResult: const Error('error'),
        bookmarkChangedStream: Stream.empty(),
      );
      final mockRecipeRepository = MockRecipeRepository(
        getRecipesResult: Error(NetworkError.unKnown),
        searchRecipesResult: const Error(NetworkError.unKnown),
        getRecentRecipesResult: const Error(NetworkError.unKnown),
        addRecentRecipesResult: const Error(NetworkError.unKnown),
      );
      final useCase = GetSavedRecipesUseCase(
        bookmarkRepository: mockBookmarkRepository,
        recipeRepository: mockRecipeRepository,
      );

      final result = await useCase.execute();

      expect(result, isA<Error>());
      expect((result as Error).error, '전체 레시피가 없습니다.');
    });
  });
}
