import 'package:flutter_recipe_app/feature/search_recipes/data/data_source/filter_search_state_data_source.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/dto/filter_search_state_dto.dart';
import 'package:flutter_recipe_app/feature/search_recipes/data/repository/filter_search_state_repository_impl.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_category.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_rate.dart';
import 'package:flutter_recipe_app/feature/search_recipes/domain/model/filter_sort_by.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'filter_search_state_repository_impl_test.mocks.dart';

@GenerateMocks([FilterSearchStateDataSource])
void main() {
  group('FilterSearchStateRepositoryImpl', () {
    late FilterSearchStateRepositoryImpl repository;
    late MockFilterSearchStateDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockFilterSearchStateDataSource();
      repository = FilterSearchStateRepositoryImpl(
        filterSearchStateDataSource: mockDataSource,
      );
    });

    group('findFilterSearchState', () {
      test('Given data source returns a DTO, '
          'When findFilterSearchState is called, '
          'Then it should return the mapped model', () async {
        // Given
        final dto = FilterSearchStateDto(
          filterSortBy: FilterSortBy.newest.toString(),
          filterRate: FilterRate.four.toInt(),
          filterCategory: FilterCategory.chinese.toString(),
        );
        when(
          mockDataSource.findFilterSearchState(),
        ).thenAnswer((_) async => dto);

        // When
        final result = await repository.findFilterSearchState();

        // Then
        expect(result, isA<FilterSearchState>());
        expect(result.filterSortBy, FilterSortBy.newest);
        expect(result.filterRate, FilterRate.four);
        expect(result.filterCategory, FilterCategory.chinese);
        verify(mockDataSource.findFilterSearchState()).called(1);
      });

      test('Given data source throws an exception, '
          'When findFilterSearchState is called, '
          'Then it should re-throw the exception', () async {
        // Given
        final exception = Exception('Failed to find filter state');
        when(mockDataSource.findFilterSearchState()).thenThrow(exception);

        // When & Then
        expect(
          () => repository.findFilterSearchState(),
          throwsA(isA<Exception>()),
        );
        verify(mockDataSource.findFilterSearchState()).called(1);
      });
    });

    group('saveFilterSearchState', () {
      test('Given a model, '
          'When saveFilterSearchState is called, '
          'Then it should call data source to save the mapped DTO', () async {
        // Given
        const stateToSave = FilterSearchState(
          filterSortBy: FilterSortBy.oldest,
          filterRate: FilterRate.one,
          filterCategory: FilterCategory.dinner,
        );
        final expectedDto = FilterSearchStateDto(
          filterSortBy: FilterSortBy.oldest.toString(),
          filterRate: FilterRate.one.toInt(),
          filterCategory: FilterCategory.dinner.toString(),
        );
        when(
          mockDataSource.saveFilterSearchState(any),
        ).thenAnswer((_) async {});

        // When
        await repository.saveFilterSearchState(stateToSave);

        // Then
        verify(
          mockDataSource.saveFilterSearchState(
            argThat(
              predicate<FilterSearchStateDto>((dto) {
                return dto.filterSortBy == expectedDto.filterSortBy &&
                    dto.filterRate == expectedDto.filterRate &&
                    dto.filterCategory == expectedDto.filterCategory;
              }),
            ),
          ),
        ).called(1);
      });

      test('Given data source throws an exception, '
          'When saveFilterSearchState is called, '
          'Then it should re-throw the exception', () async {
        // Given
        const stateToSave = FilterSearchState(
          filterSortBy: FilterSortBy.popularity,
          filterRate: FilterRate.five,
          filterCategory: FilterCategory.fruit,
        );
        final exception = Exception('Failed to save filter state');
        when(mockDataSource.saveFilterSearchState(any)).thenThrow(exception);

        // When & Then
        expect(
          () => repository.saveFilterSearchState(stateToSave),
          throwsA(isA<Exception>()),
        );
        verify(mockDataSource.saveFilterSearchState(any)).called(1);
      });
    });
  });
}
