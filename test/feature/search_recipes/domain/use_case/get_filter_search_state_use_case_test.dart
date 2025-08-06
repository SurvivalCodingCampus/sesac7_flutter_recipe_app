import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_sort_by.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/repository/filter_search_state_repository.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/use_case/get_filter_search_state_use_case.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_filter_search_state_use_case_test.mocks.dart';

@GenerateMocks([FilterSearchStateRepository])
void main() {
  group('GetFilterSearchStateUseCase', () {
    late GetFilterSearchStateUseCase useCase;
    late MockFilterSearchStateRepository mockRepository;

    setUp(() {
      mockRepository = MockFilterSearchStateRepository();
      useCase = GetFilterSearchStateUseCase(
        filterSearchStateRepository: mockRepository,
      );
    });

    test(
        'Given the repository returns a FilterSearchState, '
        'When execute is called, '
        'Then it should return the FilterSearchState', () async {
      // Given
      const expectedState = FilterSearchState(
        filterSortBy: FilterSortBy.newest,
        filterRate: FilterRate.four,
        filterCategory: FilterCategory.chinese,
      );
      when(mockRepository.findFilterSearchState())
          .thenAnswer((_) async => expectedState);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockRepository.findFilterSearchState()).called(1);
      expect(result, isA<Success<FilterSearchState, String>>());
      expect((result as Success).data, expectedState);
    });

    test(
        'Given the repository throws an exception, '
        'When execute is called, '
        'Then it should return an error result', () async {
      // Given
      final exception = Exception('Failed to fetch filter state');
      when(mockRepository.findFilterSearchState()).thenThrow(exception);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockRepository.findFilterSearchState()).called(1);
      expect(result, isA<Error<FilterSearchState, String>>());
      expect((result as Error).error, exception.toString());
    });
  });
}