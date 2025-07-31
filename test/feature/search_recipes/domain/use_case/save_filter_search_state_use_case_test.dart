import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_sort_by.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/filter_search_state_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/save_filter_search_state_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_filter_search_state_use_case_test.mocks.dart';

@GenerateMocks([FilterSearchStateRepository])
void main() {
  group('SaveFilterSearchStateUseCase', () {
    late SaveFilterSearchStateUseCase useCase;
    late MockFilterSearchStateRepository mockRepository;

    setUp(() {
      mockRepository = MockFilterSearchStateRepository();
      useCase = SaveFilterSearchStateUseCase(
        filterSearchStateRepository: mockRepository,
      );
    });

    test(
        'Given a FilterSearchState, '
        'When execute is called, '
        'Then it should call the repository to save the state', () async {
      // Given
      const stateToSave = FilterSearchState(
        filterSortBy: FilterSortBy.newest,
        filterRate: FilterRate.four,
        filterCategory: FilterCategory.chinese,
      );
      when(mockRepository.saveFilterSearchState(stateToSave))
          .thenAnswer((_) async {});

      // When
      await useCase.execute(stateToSave);

      // Then
      verify(mockRepository.saveFilterSearchState(stateToSave)).called(1);
    });

    test(
        'Given the repository throws an exception, '
        'When execute is called, '
        'Then it should handle the exception gracefully', () async {
      // Given
      const stateToSave = FilterSearchState(
        filterSortBy: FilterSortBy.oldest,
        filterRate: FilterRate.one,
        filterCategory: FilterCategory.dinner,
      );
      final exception = Exception('Failed to save filter state');
      when(mockRepository.saveFilterSearchState(stateToSave))
          .thenThrow(exception);

      // When
      final call = useCase.execute(stateToSave);

      // Then
      // The use case should not re-throw the exception, so we expect a normal completion.
      await expectLater(call, completes);
      verify(mockRepository.saveFilterSearchState(stateToSave)).called(1);
    });
  });
}