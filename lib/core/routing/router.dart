import 'package:flutter_recipe_app/core/routing/query_parameters.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/di/di.dart';
import 'package:flutter_recipe_app/feature/authentication/presentation/sign_in_screen.dart';
import 'package:flutter_recipe_app/feature/authentication/presentation/sign_up_screen.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_screen_root.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_screen_root.dart';
import 'package:flutter_recipe_app/feature/main_navigation/presentation/main_navigation_screen.dart';
import 'package:flutter_recipe_app/feature/notifications/presentation/notifications_screen.dart';
import 'package:flutter_recipe_app/feature/profile/presentation/profile_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen_root.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter() => GoRouter(
  // initialLocation: Routes.splash,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen(
          onStartCookingTap: () => context.go(Routes.signIn),
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          onSignInTap: () => context.go(Routes.home),
          onSignUpTap: () => context.go(Routes.signUp),
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          onSignInTap: () => context.go(Routes.signIn),
        );
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScreen(
          currentIndex: navigationShell.currentIndex,
          onTabSelected: navigationShell.goBranch,
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return HomeScreenRoot(viewModel: getIt());
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                return SavedRecipesScreenRoot(
                  viewModel: getIt(),
                  onTapRecipeCard: (String recipeId) {
                    context.push(
                      Uri(
                        path: Routes.ingredient,
                        queryParameters: {QueryParameters.id: recipeId},
                      ).toString(),
                    );
                  },
                );
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
              builder: (context, state) {
                return const NotificationsScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final id = state.uri.queryParameters[QueryParameters.id]!;
        // TODO: id null 기본 화면
        return IngredientScreenRoot(
          recipeId: id,
          viewModel: getIt(),
          onTapBack: () => context.pop(),
        );
      },
    ),
  ],
);
