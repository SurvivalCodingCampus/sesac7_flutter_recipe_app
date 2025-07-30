import 'package:flutter_recipe_app/feature/home/domain/use_case/save_bookmark_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/repository/bookmark_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_bookmark_use_case_test.mocks.dart';

@GenerateMocks([BookmarkRepository])
void main() {
  group('SaveBookmarkUseCase', () {
    late SaveBookmarkUseCase useCase;
    late MockBookmarkRepository mockBookmarkRepository;

    setUp(() {
      mockBookmarkRepository = MockBookmarkRepository();
      useCase = SaveBookmarkUseCase(bookmarkRepository: mockBookmarkRepository);
    });

    test(
        'Given a recipe ID, ' 
        'When execute is called, ' 
        'Then it should call the repository to save the bookmark', () {
      // Given
      const recipeId = 'recipe-123';
      when(mockBookmarkRepository.saveBookmark(any))
          .thenAnswer((_) async => Future.value());

      // When
      useCase.execute(recipeId);

      // Then
      verify(mockBookmarkRepository.saveBookmark(recipeId)).called(1);
    });

    test(
        'Given the repository throws an exception, ' 
        'When execute is called, ' 
        'Then it should handle the exception and not re-throw', () {
      // Given
      const recipeId = 'recipe-456';
      final exception = Exception('Database connection failed');
      when(mockBookmarkRepository.saveBookmark(any)).thenThrow(exception);

      // When
      void call() => useCase.execute(recipeId);

      // Then
      expect(call, returnsNormally);
      verify(mockBookmarkRepository.saveBookmark(recipeId)).called(1);
    });
  });
}
