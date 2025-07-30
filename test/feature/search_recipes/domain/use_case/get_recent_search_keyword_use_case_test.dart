import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/search_history_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_recent_search_keyword_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recent_search_keyword_use_case_test.mocks.dart';

@GenerateMocks([SearchHistoryRepository])
void main() {
  group('GetRecentSearchKeywordUseCase', () {
    late GetRecentSearchKeywordUseCase useCase;
    late MockSearchHistoryRepository mockSearchHistoryRepository;

    setUp(() {
      mockSearchHistoryRepository = MockSearchHistoryRepository();
      useCase = GetRecentSearchKeywordUseCase(
        searchHistoryRepository: mockSearchHistoryRepository,
      );
    });

    test(
        'Given the repository returns a search history, ' 
        'When execute is called, ' 
        'Then it should return the last keyword', () async {
      // Given
      final searchHistory = ['pizza', 'sushi', 'burger'];
      when(mockSearchHistoryRepository.fetchSearchHistory())
          .thenAnswer((_) async => searchHistory);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockSearchHistoryRepository.fetchSearchHistory()).called(1);
      expect(result, isA<Success<String, String>>());
      expect((result as Success).data, 'burger');
    });

    test(
        'Given the repository returns an empty history, ' 
        'When execute is called, ' 
        'Then it should return an empty string', () async {
      // Given
      when(mockSearchHistoryRepository.fetchSearchHistory())
          .thenAnswer((_) async => []);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockSearchHistoryRepository.fetchSearchHistory()).called(1);
      expect(result, isA<Success<String, String>>());
      expect((result as Success).data, '');
    });

    test(
        'Given the repository throws an exception, ' 
        'When execute is called, ' 
        'Then it should return an error result', () async {
      // Given
      final exception = Exception('Failed to fetch history');
      when(mockSearchHistoryRepository.fetchSearchHistory())
          .thenThrow(exception);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockSearchHistoryRepository.fetchSearchHistory()).called(1);
      expect(result, isA<Error<String, String>>());
      expect((result as Error).error, exception.toString());
    });
  });
}
