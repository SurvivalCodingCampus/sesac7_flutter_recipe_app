import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/recent_search_keyword_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_recent_search_keyword_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recent_search_keyword_use_case_test.mocks.dart';

@GenerateMocks([RecentSearchKeywordRepository])
void main() {
  group('GetRecentSearchKeywordUseCase', () {
    late GetRecentSearchKeywordUseCase useCase;
    late MockRecentSearchKeywordRepository mockRecentSearchKeywordRepository;

    setUp(() {
      mockRecentSearchKeywordRepository = MockRecentSearchKeywordRepository();
      useCase = GetRecentSearchKeywordUseCase(
        searchHistoryRepository: mockRecentSearchKeywordRepository,
      );
    });

    test(
        'Given the repository returns a search keyword, '
        'When execute is called, '
        'Then it should return the keyword', () async {
      // Given
      const keyword = 'burger';
      when(
        mockRecentSearchKeywordRepository.fetchRecentSearchKeyword(),
      ).thenAnswer((_) async => keyword);

      // When
      final result = await useCase.execute();

      // Then
      verify(
        mockRecentSearchKeywordRepository.fetchRecentSearchKeyword(),
      ).called(1);
      expect(result, isA<Success<String, String>>());
      expect((result as Success).data, keyword);
    });

    test(
        'Given the repository returns an empty string, '
        'When execute is called, '
        'Then it should return an empty string', () async {
      // Given
      when(
        mockRecentSearchKeywordRepository.fetchRecentSearchKeyword(),
      ).thenAnswer((_) async => '');

      // When
      final result = await useCase.execute();

      // Then
      verify(mockRecentSearchKeywordRepository.fetchRecentSearchKeyword())
          .called(1);
      expect(result, isA<Success<String, String>>());
      expect((result as Success).data, '');
    });

    test(
        'Given the repository throws an exception, '
        'When execute is called, '
        'Then it should return an error result', () async {
      // Given
      final exception = Exception('Failed to fetch history');
      when(
        mockRecentSearchKeywordRepository.fetchRecentSearchKeyword(),
      ).thenThrow(exception);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockRecentSearchKeywordRepository.fetchRecentSearchKeyword())
          .called(1);
      expect(result, isA<Error<String, String>>());
      expect((result as Error).error, exception.toString());
    });
  });
}