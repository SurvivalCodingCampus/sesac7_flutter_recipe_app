
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_event.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_system_settings_repository.dart';

void main() {
  group('SplashViewModel', () {
    late SplashViewModel viewModel;
    late MockSystemSettingsRepository mockSystemSettingsRepository;

    setUp(() {
      mockSystemSettingsRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Result.success(true),
      );
      viewModel = SplashViewModel(
        getAirplaneModeActivateUseCase: GetAirplaneModeActivateUseCase(
          systemSettingsRepository: mockSystemSettingsRepository,
        ),
      );
    });

    test('checkAirplaneModeActivate should emit ShowAirplaneModeActivateError with true on success', () async {
      mockSystemSettingsRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Result.success(true),
      );
      viewModel = SplashViewModel(
        getAirplaneModeActivateUseCase: GetAirplaneModeActivateUseCase(
          systemSettingsRepository: mockSystemSettingsRepository,
        ),
      );

      final expectedEvent = SplashEvent.showAirplaneModeActivateError(true);
      expectLater(viewModel.eventStream, emitsInOrder([expectedEvent]));

      viewModel.checkAirplaneModeActivate();
    });

    test('checkAirplaneModeActivate should emit ShowAirplaneModeActivateError with false on success', () async {
      mockSystemSettingsRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Result.success(false),
      );
      viewModel = SplashViewModel(
        getAirplaneModeActivateUseCase: GetAirplaneModeActivateUseCase(
          systemSettingsRepository: mockSystemSettingsRepository,
        ),
      );

      final expectedEvent = SplashEvent.showAirplaneModeActivateError(false);
      expectLater(viewModel.eventStream, emitsInOrder([expectedEvent]));

      viewModel.checkAirplaneModeActivate();
    });

    test('checkAirplaneModeActivate should emit ShowAirplaneModeActivateError with true on error', () async {
      mockSystemSettingsRepository = MockSystemSettingsRepository(
        getAirplaneModeActivateResult: const Result.error('error'),
      );
      viewModel = SplashViewModel(
        getAirplaneModeActivateUseCase: GetAirplaneModeActivateUseCase(
          systemSettingsRepository: mockSystemSettingsRepository,
        ),
      );

      final expectedEvent = SplashEvent.showAirplaneModeActivateError(true);
      expectLater(viewModel.eventStream, emitsInOrder([expectedEvent]));

      viewModel.checkAirplaneModeActivate();
    });
  });
}
