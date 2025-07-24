import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/di/di_setup.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) {
            navigationShell.goBranch(index);
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                return SavedRecipeScreen(
                  savedRecipeViewModel: getIt()..fetchSavedRecipes(),
                  onSavedRecipeItemClick: (int id) {
                    context.push(Routes.ingredientWithId(id));
                  },
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen(
          onStartButtonClick: () {
            context.go(Routes.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          onSignInButtonClick: () {
            context.go(Routes.home);
          },
          onSignUpButtonClick: () {
            context.go(Routes.signUp);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          onSignUpButtonClick: () {
            context.go(Routes.home);
          },
          onSignInButtonClick: () {
            context.go(Routes.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.ingredientRelative,
      builder: (context, state) {
        return IngredientScreen(
          ingredientViewModel: getIt(),
          onBackButtonClick: () {
            context.pop();
          },
        );
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final int id = int.parse(state.pathParameters['id']!);
            return IngredientScreen(
              ingredientViewModel: getIt()
                ..fetchCurrentSelectedRecipe(id)
                ..fetchCurrentSelectedRecipeProcedures(id),
              onBackButtonClick: () {
                context.pop();
              },
            );
          },
        ),
      ],
    ),
  ],
);
