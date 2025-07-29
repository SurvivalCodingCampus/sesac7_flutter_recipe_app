import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/tab/tab_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/person_repository_impl.dart';
import '../../di/di_setup.dart';
import '../../domain/model/recipe.dart';
import '../../presentation/screen/ingredient/ingredient_screen.dart';
import '../../presentation/screen/main/main_screen.dart';
import '../../presentation/screen/main/main_view_model.dart';
import '../../presentation/screen/saved_recipes/saved_recipes_screen.dart';
import '../../presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import '../../presentation/screen/search_recipes/search_recipes_screen_root.dart';
import '../../presentation/screen/tab/tab_screen.dart';

final router = GoRouter(
  initialLocation: Routes.main,
  routes: [
    GoRoute(
      path: Routes.ingredientWithId,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return Scaffold(
            body: Center(
              child: Text('잘못된 페이지 요청'),
            ),
          );
        }

        return IngredientScreen(
          viewModel: getIt()..fetchRecipe(int.parse(id)),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabViewModel(
          color: Colors.green,
          child: TabScreen(
            body: navigationShell,
            currentIndex: navigationShell.currentIndex,
            onTap: (int index) {
              navigationShell.goBranch(index);
            },
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.main,
              builder: (context, state) {
                final mainViewModel = MainViewModel(
                  personRepository: PersonRepositoryImpl(),
                );
                mainViewModel.fetchPersonData();
                return ListenableBuilder(
                  listenable: mainViewModel,
                  builder: (context, child) {
                    return MainScreen(
                      viewModel: mainViewModel,
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
              path: Routes.savedRecipes,
              builder: (context, state) {
                final savedRecipesViewModel = getIt<SavedRecipesViewModel>();
                savedRecipesViewModel.fetchRecipes();

                return ListenableBuilder(
                  listenable: savedRecipesViewModel,
                  builder: (context, child) {
                    return SavedRecipesScreen(
                      viewModel: savedRecipesViewModel,
                      onTapRecipe: (Recipe recipe) {
                        context.push(Routes.getIngredientWithId(recipe.id));
                      },
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
              path: Routes.searchRecipes,
              builder: (context, state) {
                return SearchRecipesScreenRoot();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.main,
              builder: (context, state) {
                return MainScreen(
                  viewModel: getIt()..fetchPersonData(),
                );
              },
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: Routes.main,
    //   builder: (context, state) {
    //     final mainViewModel = MainViewModel(
    //       personRepository: PersonRepositoryImpl(),
    //     );
    //     mainViewModel.fetchPersonData();
    //     return ListenableBuilder(
    //       listenable: mainViewModel,
    //       builder: (context, child) {
    //         return MainScreen(
    //           viewModel: mainViewModel,
    //         );
    //       },
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: Routes.savedRecipes,
    //   builder: (context, state) {
    //     final savedRecipesViewModel = SavedRecipesViewModel(
    //       recipeRepository: recipeRepository,
    //     );
    //     savedRecipesViewModel.fetchRecipes();
    //     return ListenableBuilder(
    //       listenable: savedRecipesViewModel,
    //       builder: (context, child) {
    //         return SavedRecipesScreen(
    //           viewModel: savedRecipesViewModel,
    //         );
    //       },
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: Routes.searchRecipes,
    //   builder: (context, state) {
    //     final searchRecipesViewModel = SearchRecipesViewModel(
    //       recipeRepository: recipeRepository,
    //     );
    //
    //     searchRecipesViewModel.fetchRecipes();
    //     return ListenableBuilder(
    //       listenable: searchRecipesViewModel,
    //       builder: (context, child) {
    //         return SearchRecipesScreen(
    //           viewModel: searchRecipesViewModel,
    //         );
    //       },
    //     );
    //   },
    // ),
  ],
);
