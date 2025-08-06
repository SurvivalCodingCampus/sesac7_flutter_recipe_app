import 'dart:async';

import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/usecase/add_user_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_airplane_mode_activate_use_case.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_action.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_event.dart';

import '../../domain/model/user.dart';

class SplashViewModel {
  final GetAirplaneModeActivateUseCase _getAirplaneModeActivateUseCase;
  final AddUserUseCase _addUserUseCase;
  final StreamController<SplashEvent> _eventController =
      StreamController<SplashEvent>();

  Stream<SplashEvent> get eventStream => _eventController.stream;

  SplashViewModel({
    required GetAirplaneModeActivateUseCase getAirplaneModeActivateUseCase,
    required AddUserUseCase addUserUseCase,
  }) : _getAirplaneModeActivateUseCase = getAirplaneModeActivateUseCase,
       _addUserUseCase = addUserUseCase;

  // fixme PGT:: 필요시 구현
  void onAction(SplashAction splashAction) {
    switch (splashAction) {
      case ClickStartButton():
        _addUser();
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

  void _addUser() async {
    final User fakeUser = User(
      id: 1,
      email: '이메일',
      name: '홍길동',
      address: '주소',
      profileImage: '프로필 이미지',
      savedRecipes: [],
      myRecipes: [],
      followers: [],
      following: [],
      job: '직업',
      introduce: '자기소개',
      notifications: [],
    );
    await _addUserUseCase.execute(fakeUser);
  }
}
