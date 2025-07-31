import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/splash/domain/repository/system_controls_repository.dart';
import 'package:flutter_recipe_app/feature/splash/domain/use_case/is_airplane_mode_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'is_airplane_mode_use_case_test.mocks.dart';

@GenerateMocks([SystemControlsRepository])
void main() {
  group('IsAirplaneModeUseCase', () {
    late IsAirplaneModeUseCase useCase;
    late MockSystemControlsRepository mockSystemControlsRepository;

    setUp(() {
      mockSystemControlsRepository = MockSystemControlsRepository();
      useCase = IsAirplaneModeUseCase(
        systemControlsRepository: mockSystemControlsRepository,
      );
    });

    test(
        'Given airplane mode is on, ' 
        'When execute is called, ' 
        'Then it should return a success result with true', () async {
      // Given
      when(mockSystemControlsRepository.isAirplaneMode())
          .thenAnswer((_) async => true);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockSystemControlsRepository.isAirplaneMode()).called(1);
      expect(result, isA<Success<bool, String>>());
      expect((result as Success).data, isTrue);
    });

    test(
        'Given airplane mode is off, ' 
        'When execute is called, ' 
        'Then it should return a success result with false', () async {
      // Given
      when(mockSystemControlsRepository.isAirplaneMode())
          .thenAnswer((_) async => false);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockSystemControlsRepository.isAirplaneMode()).called(1);
      expect(result, isA<Success<bool, String>>());
      expect((result as Success).data, isFalse);
    });

    test(
        'Given the repository throws an exception, ' 
        'When execute is called, ' 
        'Then it should return an error result', () async {
      // Given
      final exception = Exception('Failed to check airplane mode');
      when(mockSystemControlsRepository.isAirplaneMode()).thenThrow(exception);

      // When
      final result = await useCase.execute();

      // Then
      verify(mockSystemControlsRepository.isAirplaneMode()).called(1);
      expect(result, isA<Error<bool, String>>());
      expect((result as Error).error, exception.toString());
    });
  });
}
