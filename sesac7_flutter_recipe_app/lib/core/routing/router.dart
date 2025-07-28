import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/di/di_setup.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen_root.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen_root.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen_root.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_screen_root.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen_root.dart';
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
                return HomeScreenRoot(
                  getIt(),
                  moveSearchRecipeScreen: () {
                    context.push(Routes.searchRecipe);
                  },
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                return SavedRecipeScreenRoot(
                  getIt(),
                  moveSavedRecipeDetail: (int recipeId) {
                    context.push(Routes.ingredientWithId(recipeId));
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
        return SplashScreenRoot(
          splashViewModel: getIt(),
          moveSignInScreen: () {
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
        return IngredientScreenRoot(
          getIt(),
          onIngredientScreenBackButtonClick: () {
            context.pop();
          },
        );
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final int id = int.parse(state.pathParameters['id']!);
            return IngredientScreenRoot(
              getIt(),
              id: id,
              onIngredientScreenBackButtonClick: () {
                context.pop();
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: Routes.searchRecipe,
      builder: (context, state) {
        return SearchRecipesScreenRoot(
          getIt(),
          networkErrorPop: () {
            context.pop();
          },
        );
      },
    ),
  ],
);
