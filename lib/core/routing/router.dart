import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/data/mocks/data_source/mock_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/alert/alert_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/auth/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/auth/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/splash_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/home_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe/search_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/screen/user/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

final recipeDataSource = MockRecipeDataSourceImpl();
final recipeRepository = RecipeRepositoryImpl(dataSource: recipeDataSource);
final searchRecipeViewModel = SearchRecipeViewModel(recipeRepository);
final savedRecipeViewModel = SavedRecipeViewModel(recipeRepository);
final recipeViewModel = SearchRecipeViewModel(recipeRepository);

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(
          body: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => navigationShell.goBranch(index),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return HomeRecipeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final savedRecipesViewModel = SavedRecipeViewModel(
                  recipeRepository,
                );
                return ListenableBuilder(
                  listenable: savedRecipesViewModel,
                  builder: (context, child) {
                    return SavedRecipeScreen(viewModel: savedRecipesViewModel);
                  },
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.alert,
              builder: (context, state) {
                return AlertScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.userProfile,
              builder: (context, state) {
                return UserProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
