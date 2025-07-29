import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/splash/data/domain/use_case/fetch_system_settings_use_case.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_action.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_event.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_state.dart';

class SplashScreenViewModel with ChangeNotifier {
  final FetchSystemSettingsUseCase _fetchSystemSettingsUseCase;

  SplashScreenState _state = const SplashScreenState();

  SplashScreenState get state => _state;

  final _eventController = StreamController<SplashScreenEvent>();

  Stream<SplashScreenEvent> get eventStream => _eventController.stream;

  SplashScreenViewModel({
    required FetchSystemSettingsUseCase fetchSystemSettingsUseCase,
  }) : _fetchSystemSettingsUseCase = fetchSystemSettingsUseCase;

  void onAction(SplashScreenAction action) {
    switch (action) {
      case TouchStartCooking():
        if (state.isFlightMode) {
          _eventController.add(SplashScreenEvent.showFlightModeError());
        }
    }
  }

  void fetchSystemSettings() {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final isFlightMode = _fetchSystemSettingsUseCase.execute();

    _state = state.copyWith(
      isFlightMode: isFlightMode,
      isLoading: false,
    );
    notifyListeners();
  }
}
