import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/03_mvvm/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/03_mvvm/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/screen/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/screen/splash_screen.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen_view_model.dart';
import 'package:flutter_recipe_app/05_navigation/core/routes.dart';
import 'package:flutter_recipe_app/05_navigation/presentation/component/custom_bottom_app_bar.dart';
import 'package:flutter_recipe_app/05_navigation/presentation/screen/home_screen.dart';
import 'package:flutter_recipe_app/05_navigation/presentation/screen/main_screen.dart';
import 'package:flutter_recipe_app/05_navigation/presentation/screen/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screen/sign_in_screen.dart';

final SavedRecipesViewModel savedRecipesViewModel = SavedRecipesViewModel(
  recipeRepository: RecipeRepositoryImpl(dataSource: RecipeDataSourceImpl()),
);

final SearchRecipesScreenViewModel searchRecipesViewModel =
    SearchRecipesScreenViewModel(
      recipeRepository: RecipeRepositoryImpl(
        dataSource: RecipeDataSourceImpl(),
      ),
    );

final router = GoRouter(
  initialLocation: Routes.search,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen(
          onStart: () {
            context.go(Routes.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          onSignUp: () {
            context.go(Routes.signUp);
          },
          onSignIn: () {
            context.go(Routes.main);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          onSignUp: () {
            context.go(Routes.signIn);
          },
          onSignIn: () {
            context.go(Routes.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) {
        searchRecipesViewModel.fetchRecipes();
        return ListenableBuilder(
          listenable: searchRecipesViewModel,
          builder: (BuildContext context, Widget? child) {
            return SearchRecipesScreen(
              viewModel: searchRecipesViewModel,
            );
          },
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomBottomAppBar(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.main,
              builder: (context, state) {
                return MainScreen(
                  body: ListenableBuilder(
                    listenable: savedRecipesViewModel,
                    builder: (BuildContext context, Widget? child) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.bookmark,
              builder: (context, state) {
                return MainScreen(
                  body: ListenableBuilder(
                    listenable: savedRecipesViewModel,
                    builder: (BuildContext context, Widget? child) {
                      return SavedRecipesScreen(
                        viewModel: savedRecipesViewModel,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notification,
              builder: (context, state) {
                return MainScreen(
                  body: ListenableBuilder(
                    listenable: savedRecipesViewModel,
                    builder: (BuildContext context, Widget? child) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.myPage,
              builder: (context, state) {
                return MainScreen(
                  body: ListenableBuilder(
                    listenable: savedRecipesViewModel,
                    builder: (BuildContext context, Widget? child) {
                      return SavedRecipesScreen(
                        viewModel: savedRecipesViewModel,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
