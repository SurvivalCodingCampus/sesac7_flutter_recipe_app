import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_action.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_event.dart';
import 'package:flutter_recipe_app/features/splash/presentation/screen/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';

class SplashScreenRoot extends StatefulWidget {
  final SplashScreenViewModel viewModel;

  const SplashScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SplashScreenRoot> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {
  StreamSubscription<SplashScreenEvent>? _eventSubscription;

  @override
  void initState() {
    super.initState();

    if (!context.mounted) {
      return;
    }

    _eventSubscription = widget.viewModel.eventStream.listen((event) {
      switch (event) {
        case ShowFlightModeError():
          final snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text('비행기 모드를 해제해주세요.'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      builder: (BuildContext context, Widget? child) {
        return SplashScreen(
          state: widget.viewModel.state,
          onAction: (action) {
            widget.viewModel.onAction(action);

            if (action is TouchStartCooking &&
                !widget.viewModel.state.isFlightMode) {
              context.go(Routes.signIn);
            }
          },
        );
      },
    );
  }
}

/*

final snackBar = SnackBar(
              content: Text('안녕하세요! 간단한 스낵바입니다.'),
              // (선택 사항) 추가 속성들
              duration: Duration(seconds: 3), // 표시 시간 (기본값은 4초)
              action: SnackBarAction( // (선택 사항) 액션 버튼
                label: '확인',
                onPressed: () {
                  // 사용자가 '확인' 버튼을 눌렀을 때 실행될 코드
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
              backgroundColor: Colors.blueGrey, // (선택 사항) 배경색
              behavior: SnackBarBehavior.floating, // (선택 사항) 모양 (floating 또는 fixed)
              margin: EdgeInsets.all(10), // (선택 사항) behavior가 floating일 때만 적용
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // (선택 사항) 내부 패딩
            );

            // 2. ScaffoldMessenger를 사용하여 SnackBar 표시
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

 */
