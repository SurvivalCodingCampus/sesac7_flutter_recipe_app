
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_system_settings_repository.dart';

void main() {
  group('GetAirplaneModeActivateUseCase', () {
    test('should return success with true when repository returns success with true', () {
      final mockRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Success(true),
      );
      final useCase = GetAirplaneModeActivateUseCase(systemSettingsRepository: mockRepository);

      final result = useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, true);
    });

    test('should return success with false when repository returns success with false', () {
      final mockRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Success(false),
      );
      final useCase = GetAirplaneModeActivateUseCase(systemSettingsRepository: mockRepository);

      final result = useCase.execute();

      expect(result, isA<Success>());
      expect((result as Success).data, false);
    });

    test('should return error when repository returns error', () {
      final mockRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Error('error'),
      );
      final useCase = GetAirplaneModeActivateUseCase(systemSettingsRepository: mockRepository);

      final result = useCase.execute();

      expect(result, isA<Error>());
      expect((result as Error).error, 'error');
    });
  });
}
