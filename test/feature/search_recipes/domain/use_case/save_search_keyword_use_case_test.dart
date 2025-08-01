import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/recent_search_keyword_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_search_keyword_use_case_test.mocks.dart';

@GenerateMocks([RecentSearchKeywordRepository])
void main() {
  group('SaveSearchKeywordUseCase', () {
    late SaveSearchKeywordUseCase useCase;
    late MockRecentSearchKeywordRepository mockRecentSearchKeywordRepository;

    setUp(() {
      mockRecentSearchKeywordRepository = MockRecentSearchKeywordRepository();
      useCase = SaveSearchKeywordUseCase(
        searchHistoryRepository: mockRecentSearchKeywordRepository,
      );
    });

    test('Given a search keyword, '
        'When execute is called, '
        'Then it should call the repository to save the keyword', () async {
      // Given
      const keyword = 'pasta';
      when(
        mockRecentSearchKeywordRepository.saveSearchKeyword(any),
      ).thenAnswer((_) async {});

      // When
      await useCase.execute(keyword);

      // Then
      verify(
        mockRecentSearchKeywordRepository.saveSearchKeyword(keyword),
      ).called(1);
    });

    test('Given the repository throws an exception, '
        'When execute is called, '
        'Then it should handle the exception gracefully', () async {
      // Given
      const keyword = 'error case';
      final exception = Exception('Failed to save to database');
      when(
        mockRecentSearchKeywordRepository.saveSearchKeyword(any),
      ).thenThrow(exception);

      // When
      final call = useCase.execute(keyword);

      // Then
      // The use case should not re-throw the exception, so we expect a normal completion.
      await expectLater(call, completes);
      verify(
        mockRecentSearchKeywordRepository.saveSearchKeyword(keyword),
      ).called(1);
    });
  });
}
