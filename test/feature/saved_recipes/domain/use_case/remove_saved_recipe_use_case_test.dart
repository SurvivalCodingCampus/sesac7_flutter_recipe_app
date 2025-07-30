import 'dart:async';

import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/remove_saved_recipe_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_saved_recipe_use_case_test.mocks.dart';

@GenerateMocks([BookmarkRepository])
void main() {
  group('RemoveSavedRecipeUseCase', () {
    late RemoveSavedRecipeUseCase useCase;
    late MockBookmarkRepository mockBookmarkRepository;

    setUp(() {
      mockBookmarkRepository = MockBookmarkRepository();
      useCase = RemoveSavedRecipeUseCase(
        bookmarkRepository: mockBookmarkRepository,
      );
    });

    final initialRecipes = [
      const Recipe(
        id: '1',
        name: 'Recipe 1',
        category: 'Cat1',
        creator: 'A',
        cookingTime: '10m',
        rating: 4,
        reviewCount: 10,
        serve: 1,
        isSaved: true,
        imageUrl: '',
        imageWithoutBackground: '',
      ),
      const Recipe(
        id: '2',
        name: 'Recipe 2',
        category: 'Cat2',
        creator: 'B',
        cookingTime: '20m',
        rating: 5,
        reviewCount: 20,
        serve: 2,
        isSaved: true,
        imageUrl: '',
        imageWithoutBackground: '',
      ),
    ];
    const recipeIdToRemove = '1';

    test('Given repository is successful, '
        'When execute is called, '
        'Then it should remove bookmark and return updated list', () async {
      // Given
      when(
        mockBookmarkRepository.removeBookmarks(any),
      ).thenAnswer((_) async {});

      // When
      final result = await useCase.execute(initialRecipes, recipeIdToRemove);

      // Then
      verify(
        mockBookmarkRepository.removeBookmarks(recipeIdToRemove),
      ).called(1);
      expect(result, isA<Success<List<Recipe>, NetworkError>>());

      final updatedList = (result as Success).data;
      expect(updatedList.length, 1);
      expect(updatedList.first.id, '2');
    });

    void testExceptionHandling(
      Exception thrownException,
      NetworkError expectedError,
    ) {
      test('Given repository throws ${thrownException.runtimeType}, '
          'When execute is called, '
          'Then it should return a ${expectedError.name} error', () async {
        // Given
        when(
          mockBookmarkRepository.removeBookmarks(any),
        ).thenThrow(thrownException);

        // When
        final result = await useCase.execute(initialRecipes, recipeIdToRemove);

        // Then
        verify(
          mockBookmarkRepository.removeBookmarks(recipeIdToRemove),
        ).called(1);
        expect(result, isA<Error<List<Recipe>, NetworkError>>());
        expect((result as Error).error, expectedError);
      });
    }

    testExceptionHandling(
      TimeoutException('Request timed out'),
      NetworkError.requestTimeout,
    );
    testExceptionHandling(
      FormatException('Invalid format'),
      NetworkError.parseError,
    );
    testExceptionHandling(Exception('Unknown error'), NetworkError.unknown);
  });
}
