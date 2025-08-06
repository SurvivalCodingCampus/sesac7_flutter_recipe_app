import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_action.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_event.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_view_model.dart';

class SplashScreenRoot extends StatefulWidget {
  final SplashViewModel _splashViewModel;
  final VoidCallback moveSignInScreen;

  const SplashScreenRoot({
    super.key,
    required SplashViewModel splashViewModel,
    required this.moveSignInScreen,
  }) : _splashViewModel = splashViewModel;

  @override
  State<SplashScreenRoot> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {
  StreamSubscription<SplashEvent>? _subscription;

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      onAction: (action) {
        switch (action) {
          case ClickStartButton():
            widget._splashViewModel.checkAirplaneModeActivate();
            _subscription ??= widget._splashViewModel.eventStream.listen((
              event,
            ) {
              switch (event) {
                case ShowAirplaneModeActivateError():
                  if (event.activate) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('비행기 모드가 활성화 되어 있습니다.'),
                        ),
                      );
                    }
                  } else {
                    widget._splashViewModel.onAction(SplashAction.clickStartButton());
                    widget.moveSignInScreen();
                  }
              }
            });
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
