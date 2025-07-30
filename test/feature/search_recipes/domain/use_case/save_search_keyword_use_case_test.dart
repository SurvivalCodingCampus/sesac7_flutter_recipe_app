import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/search_history_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_search_keyword_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_search_keyword_use_case_test.mocks.dart';

@GenerateMocks([SearchHistoryRepository])
void main() {
  group('SaveSearchKeywordUseCase', () {
    late SaveSearchKeywordUseCase useCase;
    late MockSearchHistoryRepository mockSearchHistoryRepository;

    setUp(() {
      mockSearchHistoryRepository = MockSearchHistoryRepository();
      useCase = SaveSearchKeywordUseCase(
        searchHistoryRepository: mockSearchHistoryRepository,
      );
    });

    test(
        'Given a search keyword, ' 
        'When execute is called, ' 
        'Then it should call the repository to save the keyword', () async {
      // Given
      const keyword = 'pasta';
      when(mockSearchHistoryRepository.saveSearchKeyword(any))
          .thenAnswer((_) async {});

      // When
      await useCase.execute(keyword);

      // Then
      verify(mockSearchHistoryRepository.saveSearchKeyword(keyword)).called(1);
    });

    test(
        'Given the repository throws an exception, ' 
        'When execute is called, ' 
        'Then it should handle the exception gracefully', () async {
      // Given
      const keyword = 'error case';
      final exception = Exception('Failed to save to database');
      when(mockSearchHistoryRepository.saveSearchKeyword(any))
          .thenThrow(exception);

      // When
      final call = useCase.execute(keyword);

      // Then
      // The use case should not re-throw the exception, so we expect a normal completion.
      await expectLater(call, completes);
      verify(mockSearchHistoryRepository.saveSearchKeyword(keyword)).called(1);
    });
  });
}
