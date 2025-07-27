import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

import '../../di/di_setup.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/home/presentation/screen/home_screen_view_model.dart';
import '../../features/search_recipes/presentation/screen/search_recipes_screen_root.dart';
import '../../features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart';
import '../../features/show_ingredients/presentation/screen/ingredient_screen_root.dart';
import '../../features/show_ingredients/presentation/screen/ingredient_screen_view_model.dart';
import '../../features/show_saved_recipes/presentation/screen/saved_recipes_screen.dart';
import '../../features/show_saved_recipes/presentation/screen/saved_recipes_view_model.dart';
import '../../features/sign_in/presentation/screen/sign_in_screen.dart';
import '../../features/sign_up/presentation/screen/sign_up_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';
import 'presentation/component/custom_bottom_app_bar.dart';
import 'presentation/screen/main_screen.dart';

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
        return SearchRecipesScreenRoot(
          searchRecipesScreenViewModel: getIt<SearchRecipesScreenViewModel>()
            ..fetchRecipes(),
        );
      },
    ),
    GoRoute(
      path: '${Routes.ingredient}/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        return IngredientScreenRoot(
          viewModel: getIt<IngredientScreenViewModel>()..fetchRecipeById(id),
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
                return MainScreen(
                  body: SearchRecipesScreenRoot(
                    searchRecipesScreenViewModel:
                        getIt<SearchRecipesScreenViewModel>()..fetchRecipes(),
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
