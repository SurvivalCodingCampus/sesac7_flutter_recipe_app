import 'dart:async';

import 'package:flutter_recipe_app/core/utils/network_error.dart';
import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/get_procedure_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_procedure_use_case_test.mocks.dart';

@GenerateMocks([ProcedureRepository])
void main() {
  group('GetProcedureUseCase', () {
    late GetProcedureUseCase useCase;
    late MockProcedureRepository mockProcedureRepository;

    setUp(() {
      mockProcedureRepository = MockProcedureRepository();
      useCase = GetProcedureUseCase(
        procedureRepository: mockProcedureRepository,
      );
    });

    const recipeId = 'recipe-1';
    final mockProcedure = [
      'Step 1: Do this.',
      'Step 2: Do that.',
    ];

    test('Given the repository returns a procedure, '
        'When execute is called, '
        'Then it should return a success result with the procedure', () async {
      // Given
      when(
        mockProcedureRepository.fetchProcedure(any),
      ).thenAnswer((_) async => mockProcedure);

      // When
      final result = await useCase.execute(recipeId);

      // Then
      verify(mockProcedureRepository.fetchProcedure(recipeId)).called(1);
      expect(result, isA<Success<List<String>, NetworkError>>());
      expect((result as Success).data, mockProcedure);
    });

    void testExceptionHandling(
      Exception thrownException,
      NetworkError expectedError,
    ) {
      test('Given repository throws ${thrownException.runtimeType}, '
          'When execute is called, '
          'Then it should return a ${expectedError.name} error', () async {
        // Given
        when(
          mockProcedureRepository.fetchProcedure(any),
        ).thenThrow(thrownException);

        // When
        final result = await useCase.execute(recipeId);

        // Then
        verify(mockProcedureRepository.fetchProcedure(recipeId)).called(1);
        expect(result, isA<Error<List<String>, NetworkError>>());
        expect((result as Error).error, expectedError);
      });
    }

    testExceptionHandling(
      TimeoutException('Request timed out'),
      NetworkError.requestTimeout,
    );
    testExceptionHandling(
      FormatException('Invalid format'),
      NetworkError.parseError,
    );
    testExceptionHandling(Exception('Unknown error'), NetworkError.unknown);
  });
}
