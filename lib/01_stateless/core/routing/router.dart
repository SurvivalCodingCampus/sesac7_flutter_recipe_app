import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
//import 'package:flutter_recipe_app/01_stateless/data/repository/mock_saved_recipes_repository_impl.dart';
//import 'package:flutter_recipe_app/01_stateless/data/repository/saved_recipes_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

// Repositories made singleton?
//final savedRecipesRepository = MockSavedRecipesRepositoryImpl();

// view models factory

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return SplashScreen(
            splashScreenButtonOnTap: () => context.go(Routes.signIn),
          );
        }
    ),
    GoRoute(
        path: Routes.signIn,
        builder: (context, state) {
          return SignInScreen(
            signInButtonOnTap: () {},
            signUpButtonOnTap: () => context.go(Routes.signUp)
          );
        }
    ),
    GoRoute(
        path: Routes.signUp,
        builder: (context, state) {
          return SignUpScreen(
            signInButtonOnTap: () => context.go(Routes.signIn),
            signUpButtonOnTap: () {},
          );
        }
    ),
  ],
);