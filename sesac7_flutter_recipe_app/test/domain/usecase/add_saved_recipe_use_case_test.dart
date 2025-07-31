
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/add_saved_recipe_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';

void main() {
  group('AddSavedRecipeUseCase', () {
    test('should return success when repository returns success', () async {
      final mockRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Error('error'),
        getIdsResult: const Error('error'),
        bookmarkChangedStream: Stream.empty(),
      );
      final useCase = AddSavedRecipeUseCase(bookmarkRepository: mockRepository);

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
      final useCase = AddSavedRecipeUseCase(bookmarkRepository: mockRepository);

      final result = await useCase.execute(1);

      expect(result, isA<Error>());
      expect((result as Error).error, 'error');
    });
  });
}
