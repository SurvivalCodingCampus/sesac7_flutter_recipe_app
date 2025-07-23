import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/join_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/splash_screen.dart';
import 'package:flutter_recipe_app/presentation/view_model/search_recipe_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_source/recipe_data_source_impl.dart';
import '../../data/repository/recipe_repository_impl.dart';
import '../../presentation/component/bottom_nav/Custom_bottom_navigate.dart';
import '../../presentation/screen/login_screen.dart';
import '../../presentation/screen/main_screen.dart';
import '../../presentation/view_model/filter_search_bottom_sheet_view_model.dart';
import '../../presentation/view_model/recipe_view_model.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: Routes.join,
      builder: (context, state) => JoinScreen(),
    ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomBottomNavigationBar(navigationShell: navigationShell);
/*          TabScreen(
          body: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) {
            navigationShell.goBranch(index);
          },
        );*/
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.main,
              builder: (context, state) {
                return MainScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final recipeDataSource = RecipeDataSourceImpl();
                final recipeRepository = RecipeRepositoryImpl(recipeDataSource);
                final savedRecipesViewModel = RecipeViewModel(recipeRepository: recipeRepository);
                savedRecipesViewModel.fetchRecipes();
                return SavedRecipesScreen(recipeViewModel: savedRecipesViewModel);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.searchRecipes,
              builder: (context, state) {
                final recipeDataSource = RecipeDataSourceImpl();
                final recipeRepository = RecipeRepositoryImpl(recipeDataSource);
                final searchRecipesViewModel = SearchRecipeViewModel(recipeRepository: recipeRepository);

                final filterViewModel = FilterSearchBottomSheetViewModel();

                searchRecipesViewModel.fetchRecipes();
                return SearchRecipeScreen(searchRecipeViewModel: searchRecipesViewModel, filterViewModel: filterViewModel);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notification,
              builder: (context, state) {
                return Container();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);