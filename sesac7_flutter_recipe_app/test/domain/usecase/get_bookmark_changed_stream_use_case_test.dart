import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/get_bookmark_changed_stream_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_bookmark_repository.dart';

void main() {
  group('GetBookmarkChangedStreamUseCase', () {
    test('should return the stream from the repository', () {
      final mockStream = Stream.fromIterable([null, null]);
      final mockRepository = MockBookmarkRepository(
        addResult: const Result.success(null),
        removeResult: const Result.success(null),
        getIdsResult: const Result.success([]),
        bookmarkChangedStream: mockStream,
      );
      final useCase = GetBookmarkChangedStreamUseCase(bookmarkRepository: mockRepository);

      final result = useCase.execute();

      expect(result, equals(mockStream));
    });
  });
}