import 'dart:async';

import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_action.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_event.dart';

class SplashViewModel {
  final GetAirplaneModeActivateUseCase _getAirplaneModeActivateUseCase;
  final StreamController<SplashEvent> _eventController =
      StreamController<SplashEvent>();

  Stream<SplashEvent> get eventStream => _eventController.stream;

  SplashViewModel({
    required GetAirplaneModeActivateUseCase getAirplaneModeActivateUseCase,
  }) : _getAirplaneModeActivateUseCase = getAirplaneModeActivateUseCase;

  void onAction(SplashAction splashAction) {
    switch (splashAction) {
      case ClickStartButton():
        break;
    }
  }

  void checkAirplaneModeActivate() {
    final Result<bool, String> result = _getAirplaneModeActivateUseCase
        .execute();
    switch (result) {
      case Success<bool, String>():
        _eventController.add(
          SplashEvent.showAirplaneModeActivateError(result.data),
        );
      case Error<bool, String>():
        _eventController.add(SplashEvent.showAirplaneModeActivateError(true));
    }
  }
}
