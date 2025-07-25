import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routes.dart';
import 'package:flutter_recipe_app/presentation/screen/ingredient_screen.dart';
import 'package:go_router/go_router.dart';

import '../di/di_setup.dart';
import '../presentation/component/custom_bottom_app_bar.dart';
import '../presentation/screen/home_screen.dart';
import '../presentation/screen/home_screen_view_model.dart';
import '../presentation/screen/ingredient_screen_view_model.dart';
import '../presentation/screen/main_screen.dart';
import '../presentation/screen/saved_recipes_screen.dart';
import '../presentation/screen/saved_recipes_view_model.dart';
import '../presentation/screen/search_recipes_screen.dart';
import '../presentation/screen/search_recipes_screen_view_model.dart';
import '../presentation/screen/sign_in_screen.dart';
import '../presentation/screen/sign_up_screen.dart';
import '../presentation/screen/splash_screen.dart';

final router = GoRouter(
  initialLocation: Routes.bookmark,
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
        final viewModel = getIt<SearchRecipesScreenViewModel>();
        viewModel.fetchRecipes();

        return ListenableBuilder(
          listenable: getIt(),
          builder: (BuildContext context, Widget? child) {
            return SearchRecipesScreen(
              viewModel: viewModel,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '${Routes.ingredient}/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final viewModel = getIt<IngredientScreenViewModel>();
        viewModel.fetchRecipeById(id);

        return ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child) {
            return IngredientScreen(
              viewModel: viewModel,
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
                final viewModel = getIt<HomeScreenViewModel>();
                viewModel.fetchRecipes();
                
                return MainScreen(
                  body: ListenableBuilder(
                    listenable: viewModel,
                    builder: (BuildContext context, Widget? child) {
                      return HomeScreen(
                        viewModel: viewModel,
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
              path: Routes.bookmark,
              builder: (context, state) {
                final viewModel = getIt<SavedRecipesViewModel>();

                return MainScreen(
                  body: ListenableBuilder(
                    listenable: viewModel,
                    builder: (BuildContext context, Widget? child) {
                      return SavedRecipesScreen(
                        viewModel: viewModel,
                        onClickCard: (id) {
                          context.push('${Routes.ingredient}/$id');
                        },
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
                final viewModel = getIt<SearchRecipesScreenViewModel>();
                viewModel.fetchRecipes();

                return MainScreen(
                  body: ListenableBuilder(
                    listenable: viewModel,
                    builder: (BuildContext context, Widget? child) {
                      return SearchRecipesScreen(
                        viewModel: viewModel,
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
              path: Routes.myPage,
              builder: (context, state) {
                final viewModel = getIt<SavedRecipesViewModel>();

                return MainScreen(
                  body: ListenableBuilder(
                    listenable: viewModel,
                    builder: (BuildContext context, Widget? child) {
                      return SavedRecipesScreen(
                        viewModel: viewModel,
                        onClickCard: (id) {},
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
