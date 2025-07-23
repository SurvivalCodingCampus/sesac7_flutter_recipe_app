import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/bookmark_recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_bookmark_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/home/main_body.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_body.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screen/nav_bar_screen/nav_bar_screen.dart';

// Repositories made singleton?
final RecipeRepository recipeRepository = MockRecipeRepositoryImpl();
final BookmarkRecipeRepository bookmarkRecipeRepository = MockBookmarkRecipeRepositoryImpl();

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
                return MainBody(userId: 'monkey96');
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final savedRecipesViewModel = SavedRecipesViewModel(
                  repo: bookmarkRecipeRepository,
                );
                savedRecipesViewModel.fetchBookmarkedRecipeData();
                return ListenableBuilder(
                  listenable: savedRecipesViewModel,
                  builder: (context, child) {
                    return SavedRecipesBody(viewModel: savedRecipesViewModel);
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
          splashScreenButtonOnTap: () => context.go(Routes.signIn),
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          signInButtonOnTap: () {
            context.go(Routes.main);
          },
          signUpButtonOnTap: () => context.go(Routes.signUp),
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          signInButtonOnTap: () => context.go(Routes.signIn),
          signUpButtonOnTap: () {},
        );
      },
    ),
  ],
);
