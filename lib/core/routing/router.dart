import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/value_listenable_builder.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/authentication/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/authentication/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/main_navigation/main_navigation_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/profile/profile_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/presentation/screen/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource: RecipeDataSourceImpl(),
);

final router = GoRouter(
  initialLocation: Routes.splash,
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
                return const HomeScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final viewModel = SavedRecipesViewModel(
                  recipeRepository: recipeRepository,
                );

                viewModel.fetchSavedRecipes();

                return ListenableBuilder(
                  listenable: viewModel,
                  builder: (context, child) {
                    return SavedRecipesScreen(
                      viewModel: viewModel,
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
  ],
);
