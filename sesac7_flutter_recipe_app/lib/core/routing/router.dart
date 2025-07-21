import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen();
      },
    ),
    GoRoute(path: Routes.signUp, builder: (context, state) {
      return SignUpScreen();
    })
  ],
);
