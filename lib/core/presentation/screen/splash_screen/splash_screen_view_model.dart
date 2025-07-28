import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen_action.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen_event.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen_state.dart';

import '../../../domain/use_case/check_network_status_use_case.dart';
import '../../../network/network_status.dart';

class SplashScreenViewModel with ChangeNotifier {
  final CheckNetworkStatusUseCase _checkNetworkStatusUseCase;

  final _eventController = StreamController<SplashScreenEvent>();
  Stream<SplashScreenEvent> get eventStream => _eventController.stream;

  SplashScreenState _state = SplashScreenState();
  SplashScreenState get state => _state;

  SplashScreenViewModel({required CheckNetworkStatusUseCase checkNetworkStatusUseCase})
    : _checkNetworkStatusUseCase = checkNetworkStatusUseCase;

  void onAction(SplashScreenAction action) {
    switch (action) {
      case Started():
        _checkNetworkStatus();
        break;
      case ShowNetworkErrorSnackbar():
        _showNetworkErrorSnackbar();
        break;
      case StartButtonClicked():
        _eventController.add(const SplashScreenEvent.navigateToSignIn());
        break;
    }
  }

  Future<void> _checkNetworkStatus() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _checkNetworkStatusUseCase.execute();
    _state = _state.copyWith(
      networkStatus: result,
      isLoading: false,
    );

    notifyListeners();
  }

  Future<void> _showNetworkErrorSnackbar() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final status = await _checkNetworkStatusUseCase.execute();

    _state = _state.copyWith(
      networkStatus: status,
      isLoading: false,
    );
    notifyListeners();

    if (status == NetworkStatus.disconnected) {
      _eventController.add(
        const SplashScreenEvent.showNetworkError('네트워크 상태를 확인하세요'),
      );
    }
  }

  void started() {
    _showNetworkErrorSnackbar();
  }
}