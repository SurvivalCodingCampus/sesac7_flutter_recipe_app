
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_ids_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';

void main() {
  group('GetSavedRecipeIdsUseCase', () {
    test('should return saved recipe IDs when repository returns success', () async {
      final mockRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Success(null),
        getIdsResult: const Success([1, 2, 3]),
        bookmarkChangedStream: Stream.empty(),
      );
      final useCase = GetSavedRecipeIdsUseCase(bookmarkRepository: mockRepository);

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, [1, 2, 3]);
    });

    test('should return empty list when repository returns error', () async {
      final mockRepository = MockBookmarkRepository(
        addResult: const Success(null),
        removeResult: const Success(null),
        getIdsResult: const Error('error'),
        bookmarkChangedStream: Stream.empty(),
      );
      final useCase = GetSavedRecipeIdsUseCase(bookmarkRepository: mockRepository);

      final result = await useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, isEmpty);
    });
  });
}
