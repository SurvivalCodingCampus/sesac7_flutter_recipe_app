import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/error_dialog.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_event.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_screen.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_view_model.dart';

class SplashScreenRoot extends StatefulWidget {
  final SplashViewModel viewModel;
  final VoidCallback onStartCookingTap;

  const SplashScreenRoot({
    super.key,
    required this.viewModel,
    required this.onStartCookingTap,
  });

  @override
  State<SplashScreenRoot> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {
  StreamSubscription<SplashEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init();

    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowAirplaneModeError():
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('비행기 모드를 해제 해주세요.')));
          case ShowErrorDialog():
            showErrorDialog(context, event.message);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(onStartCookingTap: widget.onStartCookingTap);
  }
}
