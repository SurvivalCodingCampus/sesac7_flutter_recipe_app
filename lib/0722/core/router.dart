import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screen/main/main_screen.dart';
import '../presentation/screen/main/home/home_screen.dart';
import '../presentation/screen/main/upload/upload_screen.dart';
import '../presentation/screen/main/notification/notification_screen.dart';
import '../presentation/screen/main/profile/profile_screen.dart';
import '../presentation/screen/sign_in/sign_in_screen.dart';
import '../presentation/screen/sign_up/sign_up_screen.dart';
import '../presentation/screen/welcome/welcome_screen.dart';

// GoRouter: SceneManager (관리자)
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // --- 1. 온보딩/로그인 플로우를 위한 독립적인 씬들 ---
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),

    // --- 2. 로그인 후의 메인 앱을 위한 셸(Shell) 라우트 ---
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/upload',
              builder: (context, state) => const UploadScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) => const NotificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
