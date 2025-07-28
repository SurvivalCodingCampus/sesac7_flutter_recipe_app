import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen_action.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen_event.dart';
import 'package:flutter_recipe_app/core/presentation/screen/splash_screen/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';

class SplashScreenRoot extends StatefulWidget {
  final SplashScreenViewModel viewModel;

  const SplashScreenRoot({super.key, required this.viewModel});

  @override
  State<SplashScreenRoot> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {

  StreamSubscription? _eventSubscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.started();
    _eventSubscription = widget.viewModel.eventStream.listen((event){
      if (mounted) {
        switch (event) {
          case ShowNetworkError():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(event.message),
                duration: const Duration(seconds: 3),
              ),
            );
            break;
          case NavigateToSignIn():
            GoRouter.of(context).go('/sign-in');
            break;
          case Started():
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return SplashScreen(
          state: widget.viewModel.state,
          onAction: (SplashScreenAction action) {
            widget.viewModel.onAction(action);
          },
        );
      }
    );
  }
}
