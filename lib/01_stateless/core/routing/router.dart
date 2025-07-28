import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/01_stateless/core/di/di_get_it.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_root.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_root.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screen/nav_bar_screen/nav_bar_screen.dart';

// view models factory

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavBarScreen(
          body: navigationShell,
          index: navigationShell.currentIndex,
          onTap: (int index) {
            navigationShell.goBranch(index);
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.main,
              builder: (context, state) {
                return MainRoot(viewModel: getIt<MainViewModel>());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                return SavedRecipesRoot(viewModel: getIt<SavedRecipesViewModel>());
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
          splashScreenButtonOnTap: () => context.go(Routes.signIn),
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          signInButtonOnTap: () => context.go(Routes.main),
          signUpButtonOnTap: () => context.go(Routes.signUp),
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          signInButtonOnTap: () => context.go(Routes.signIn),
          signUpButtonOnTap: () => {},
        );
      },
    ),
    GoRoute(
      path: '${Routes.recipeDetail}/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final viewModel = getIt<RecipeDetailViewModel>();
        viewModel.getRecipeDetailData(id);
        return ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return RecipeDetailScreen(viewModel: viewModel, recipeId: id);
          },
        );
      },
    ),
  ],
);
