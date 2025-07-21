import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/presentation/screen/auth/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/auth/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
  ],
);
