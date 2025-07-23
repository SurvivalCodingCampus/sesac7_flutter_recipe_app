import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routes.dart';
import 'package:flutter_recipe_app/data/data_source/mock_bookmark_data_source_impl.dart';
import 'package:flutter_recipe_app/data/data_source/mock_procedure_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/ingredient_screen.dart';
import 'package:go_router/go_router.dart';

import '../data/data_source/recipe_data_source_impl.dart';
import '../data/repository/recipe_repository_impl.dart';
import '../presentation/component/custom_bottom_app_bar.dart';
import '../presentation/screen/home_screen.dart';
import '../presentation/screen/ingredient_screen_view_model.dart';
import '../presentation/screen/main_screen.dart';
import '../presentation/screen/saved_recipes_screen.dart';
import '../presentation/screen/saved_recipes_view_model.dart';
import '../presentation/screen/search_recipes_screen.dart';
import '../presentation/screen/search_recipes_screen_view_model.dart';
import '../presentation/screen/sign_in_screen.dart';
import '../presentation/screen/sign_up_screen.dart';
import '../presentation/screen/splash_screen.dart';

// ViewModel
final SavedRecipesViewModel savedRecipesViewModel = SavedRecipesViewModel(
  recipeRepository: RecipeRepositoryImpl(dataSource: RecipeDataSourceImpl()),
  bookmarkRepository: MockBookmarkRepositoryImpl(
    dataSource: MockBookmarkDataSourceImpl(),
  ),
);

final IngredientScreenViewModel ingredientScreenViewModel =
    IngredientScreenViewModel(
      recipeRepository: RecipeRepositoryImpl(
        dataSource: RecipeDataSourceImpl(),
      ),
      procedureRepository: MockProcedureRepositoryImpl(
        procedureDataSource: MockProcedureDataSourceImpl(),
      ),
    );

final SearchRecipesScreenViewModel searchRecipesViewModel =
    SearchRecipesScreenViewModel(
      recipeRepository: RecipeRepositoryImpl(
        dataSource: RecipeDataSourceImpl(),
      ),
    );

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
    GoRoute(
      path: '${Routes.ingredient}/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        ingredientScreenViewModel.fetchRecipeById(id);

        return ListenableBuilder(
          listenable: ingredientScreenViewModel,
          builder: (BuildContext context, Widget? child) {
            return IngredientScreen(
              viewModel: ingredientScreenViewModel,
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
