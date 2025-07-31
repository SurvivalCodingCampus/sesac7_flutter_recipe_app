
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';

void main() {
  group('RemoveSavedRecipeUseCase', () {
    test('should return success when repository returns success', () async {
      final mockRepository = MockBookmarkRepository(
        addResult: const Error('error'),
        removeResult: const Success(null),
        getIdsResult: const Error('error'),
        bookmarkChangedStream: Stream.empty(),
      );
      final useCase = RemoveSavedRecipeUseCase(bookmarkRepository: mockRepository);

      final result = await useCase.execute(1);

      expect(result, isA<Success>());
    });

    test('should return error when repository returns error', () async {
      final mockRepository = MockBookmarkRepository(
        addResult: const Error('error'),
        removeResult: const Error('error'),
        getIdsResult: const Error('error'),
        bookmarkChangedStream: Stream.empty(),
      );
      final useCase = RemoveSavedRecipeUseCase(bookmarkRepository: mockRepository);

      final result = await useCase.execute(1);

      expect(result, isA<Error>());
      expect((result as Error).error, 'error');
    });
  });
}
