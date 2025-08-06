import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/recent_search_keyword_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/repository/recent_search_keyword_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'recent_search_keyword_repository_impl_test.mocks.dart';

@GenerateMocks([RecentSearchKeywordDataSource])
void main() {
  group('RecentSearchKeywordRepositoryImpl', () {
    late RecentSearchKeywordRepositoryImpl repository;
    late MockRecentSearchKeywordDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockRecentSearchKeywordDataSource();
      repository = RecentSearchKeywordRepositoryImpl(
        recentSearchKeywordDataSource: mockDataSource,
      );
    });

    group('fetchRecentSearchKeyword', () {
      test(
          'Given data source returns a keyword, '
          'When fetchRecentSearchKeyword is called, '
          'Then it should return the keyword', () async {
        // Given
        const expectedKeyword = 'test_keyword';
        when(mockDataSource.fetchRecentSearchKeyword())
            .thenAnswer((_) async => expectedKeyword);

        // When
        final result = await repository.fetchRecentSearchKeyword();

        // Then
        expect(result, expectedKeyword);
        verify(mockDataSource.fetchRecentSearchKeyword()).called(1);
      });

      test(
          'Given data source returns null, '
          'When fetchRecentSearchKeyword is called, '
          'Then it should return an empty string', () async {
        // Given
        when(mockDataSource.fetchRecentSearchKeyword())
            .thenAnswer((_) async => null);

        // When
        final result = await repository.fetchRecentSearchKeyword();

        // Then
        expect(result, '');
        verify(mockDataSource.fetchRecentSearchKeyword()).called(1);
      });

      test(
          'Given data source throws an exception, '
          'When fetchRecentSearchKeyword is called, '
          'Then it should re-throw the exception', () async {
        // Given
        final exception = Exception('Failed to fetch');
        when(mockDataSource.fetchRecentSearchKeyword()).thenThrow(exception);

        // When & Then
        expect(
          () => repository.fetchRecentSearchKeyword(),
          throwsA(isA<Exception>()),
        );
        verify(mockDataSource.fetchRecentSearchKeyword()).called(1);
      });
    });

    group('saveSearchKeyword', () {
      test(
          'Given a keyword, '
          'When saveSearchKeyword is called, '
          'Then it should call data source to save the keyword', () async {
        // Given
        const keywordToSave = 'new_keyword';
        when(mockDataSource.saveSearchKeyword(keywordToSave))
            .thenAnswer((_) async => {});

        // When
        await repository.saveSearchKeyword(keywordToSave);

        // Then
        verify(mockDataSource.saveSearchKeyword(keywordToSave)).called(1);
      });

      test(
          'Given data source throws an exception, '
          'When saveSearchKeyword is called, '
          'Then it should re-throw the exception', () async {
        // Given
        const keywordToSave = 'error_keyword';
        final exception = Exception('Failed to save');
        when(mockDataSource.saveSearchKeyword(keywordToSave))
            .thenThrow(exception);

        // When & Then
        expect(
          () => repository.saveSearchKeyword(keywordToSave),
          throwsA(isA<Exception>()),
        );
        verify(mockDataSource.saveSearchKeyword(keywordToSave)).called(1);
      });
    });
  });
}