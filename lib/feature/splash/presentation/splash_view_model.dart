import 'dart:async';

import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/splash/domain/use_case/is_airplane_mode_use_case.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_event.dart';

class SplashViewModel {
  final IsAirplaneModeUseCase _isAirplaneModeUseCase;
  final StreamController<SplashEvent> _streamController = StreamController();

  SplashViewModel({required IsAirplaneModeUseCase isAirplaneModeUseCase})
    : _isAirplaneModeUseCase = isAirplaneModeUseCase;

  Stream<SplashEvent> get eventStream => _streamController.stream;

  void init() async {
    final result = await _isAirplaneModeUseCase.execute();

    switch (result) {
      case Success<bool, String>():
        if (result.data) {
          _streamController.add(SplashEvent.showAirplaneModeError());
        }
      case Error<bool, String>():
        _streamController.add(SplashEvent.showErrorDialog(result.error));
    }
  }
}
