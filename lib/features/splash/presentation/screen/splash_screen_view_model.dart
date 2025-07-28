import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/splash/data/domain/use_case/fetch_system_settings_use_case.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/mock_splash_screen_state.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_action.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_event.dart';

class SplashScreenViewModel with ChangeNotifier {
  final FetchSystemSettingsUseCase _fetchSystemSettingsUseCase;

  MockSplashScreenState _state = const MockSplashScreenState();

  MockSplashScreenState get state => _state;

  final _eventController = StreamController<SplashScreenEvent>();

  StreamController<SplashScreenEvent> get eventStream => _eventController;

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

    final isFlightMode = _fetchSystemSettingsUseCase.execute();

    _state = state.copyWith(
      isFlightMode: isFlightMode,
      isLoading: false,
    );
  }
}
