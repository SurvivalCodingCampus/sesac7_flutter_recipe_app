import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository/recipe_repository.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final RecipeDataSource recipeDataSource = RecipeDataSourceImpl();
final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource,
);

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
                final SavedRecipeViewModel savedRecipeViewModel =
                    SavedRecipeViewModel(
                      recipeRepository,
                    );
                savedRecipeViewModel.fetchRecipes();
                return ListenableBuilder(
                  listenable: savedRecipeViewModel,
                  builder: (context, build) {
                    return FutureBuilder(future: savedRecipeViewModel.fetchRecipes(), builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return const Center(
                      //     child: CircularProgressIndicator(),
                      //   );
                      // }
                      return SavedRecipeScreen(
                        savedRecipeViewModel: savedRecipeViewModel,
                      );
                    });
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
        return SplashScreen();
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen();
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen();
      },
    ),
  ],
);
