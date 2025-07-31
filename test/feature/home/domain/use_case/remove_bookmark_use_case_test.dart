import 'package:flutter_recipe_app/feature/home/domain/use_case/remove_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_bookmark_use_case_test.mocks.dart';

@GenerateMocks([BookmarkRepository])
void main() {
  group('RemoveBookmarkUseCase', () {
    late RemoveBookmarkUseCase useCase;
    late MockBookmarkRepository mockBookmarkRepository;

    setUp(() {
      mockBookmarkRepository = MockBookmarkRepository();
      useCase = RemoveBookmarkUseCase(bookmarkRepository: mockBookmarkRepository);
    });

    test(
        'Given a recipe ID, ' 
        'When execute is called, ' 
        'Then it should call the repository to remove the bookmark', () {
      // Given
      const recipeId = 'recipe-123';
      when(mockBookmarkRepository.removeBookmarks(any))
          .thenAnswer((_) async => Future.value());

      // When
      useCase.execute(recipeId);

      // Then
      verify(mockBookmarkRepository.removeBookmarks(recipeId)).called(1);
    });

    test(
        'Given the repository throws an exception, ' 
        'When execute is called, ' 
        'Then it should handle the exception and not re-throw', () {
      // Given
      const recipeId = 'recipe-456';
      final exception = Exception('Database connection failed');
      when(mockBookmarkRepository.removeBookmarks(any)).thenThrow(exception);

      // When
      void call() => useCase.execute(recipeId);

      // Then
      expect(call, returnsNormally);
      verify(mockBookmarkRepository.removeBookmarks(recipeId)).called(1);
    });
  });
}
