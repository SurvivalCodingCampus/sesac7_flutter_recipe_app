import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/splash/domain/use_case/is_airplane_mode_use_case.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_event.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_view_model_test.mocks.dart';

@GenerateMocks([IsAirplaneModeUseCase])
void main() {
  group('SplashViewModel', () {
    late SplashViewModel viewModel;
    late MockIsAirplaneModeUseCase mockIsAirplaneModeUseCase;

    provideDummy(Result<bool, String>.success(true));

    setUp(() {
      mockIsAirplaneModeUseCase = MockIsAirplaneModeUseCase();
      viewModel = SplashViewModel(
        isAirplaneModeUseCase: mockIsAirplaneModeUseCase,
      );
    });

    test('Given airplane mode is on, '
        'When init is called, '
        'Then it should emit a ShowAirplaneModeError event', () async {
      // Given
      when(
        mockIsAirplaneModeUseCase.execute(),
      ).thenAnswer((_) async => const Result.success(true));

      // Then: Expect the event to be emitted.
      expectLater(
        viewModel.eventStream,
        emits(isA<ShowAirplaneModeError>()),
      );

      // When: The action is performed.
      viewModel.init();

      // Verify
      verify(mockIsAirplaneModeUseCase.execute()).called(1);
    });

    test(
      'Given the use case fails, '
      'When init is called, '
      'Then it should emit a ShowErrorDialog event with the error message',
      () async {
        // Given
        const errorMessage = 'Failed to check status';
        when(
          mockIsAirplaneModeUseCase.execute(),
        ).thenAnswer((_) async => const Result.error(errorMessage));

        // Then: Expect the error event.
        expectLater(
          viewModel.eventStream,
          emits(
            isA<ShowErrorDialog>().having(
              (e) => e.message,
              'message',
              errorMessage,
            ),
          ),
        );

        // When: The action is performed.
        viewModel.init();

        // Verify
        verify(mockIsAirplaneModeUseCase.execute()).called(1);
      },
    );
  });
}
