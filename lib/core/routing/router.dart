// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/recipe_repository/recipe_repository.dart';
import 'package:flutter_recipe_app/data/recipe_repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screens/auth/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/main_screen/tabs_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/profile/profile_screeen.dart';
import 'package:flutter_recipe_app/presentation/screens/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/auth/sign_in_screen.dart';

final RecipeDataSource recipeDataSource = RecipeDataSourceImpl();
final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource,
);

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go(Routes.signIn),
      ),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (BuildContext context, GoRouterState state) => SignInScreen(
        onTapSignIn: () {
          context.go(Routes.home);
        },
        onTapSignUp: () => context.go(Routes.signUp),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (BuildContext context, GoRouterState state) => SignUpScreen(
        onTapSignIn: () => context.go(Routes.signIn),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabsScreen(
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
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final SavedRecipesViewModel savedRecipeViewModel =
                    SavedRecipesViewModel(recipeRepository);
                return ListenableBuilder(
                  listenable: savedRecipeViewModel,
                  builder: (context, child) {
                    return SavedRecipesScreen(viewModel: savedRecipeViewModel);
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
