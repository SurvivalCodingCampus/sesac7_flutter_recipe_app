import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_recipe_impl.dart';
import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipe_find_by_id_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/domain/usecase/remove_saved_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final RecipeDataSource recipeDataSource = RecipeDataSourceImpl();
final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource: recipeDataSource,
);
final BookmarkRepository bookmarkRepository = MockBookMarkRepositoryImpl();

final GetSavedRecipesUseCase getSavedRecipeUseCase = GetSavedRecipesUseCase(
  bookmarkRepository: bookmarkRepository,
);
final GetSavedRecipeFindByIdUseCase getSavedRecipeFindByIdUseCase =
    GetSavedRecipeFindByIdUseCase(
      getSavedRecipesUseCase: getSavedRecipeUseCase,
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
                      getSavedRecipesUseCase: getSavedRecipeUseCase,
                      removeSavedRecipeUseCase: RemoveSavedRecipeUseCase(
                        bookmarkRepository: bookmarkRepository,
                      ),
                    );
                savedRecipeViewModel.fetchSavedRecipes();
                return ListenableBuilder(
                  listenable: savedRecipeViewModel,
                  builder: (context, build) {
                    return SavedRecipeScreen(
                      savedRecipeViewModel: savedRecipeViewModel,
                    );
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
    GoRoute(
      path: Routes.ingredientRelative,
      builder: (context, state) {
        final IngredientViewModel ingredientViewModel = IngredientViewModel(
          getSavedRecipeFindByIdUseCase: getSavedRecipeFindByIdUseCase,
        );
        return ListenableBuilder(
          listenable: ingredientViewModel,
          builder: (context, build) {
            return IngredientScreen(
              ingredientViewModel: ingredientViewModel,
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final int id = int.parse(state.pathParameters['id']!);
            final IngredientViewModel ingredientViewModel = IngredientViewModel(
              getSavedRecipeFindByIdUseCase: getSavedRecipeFindByIdUseCase,
            );
            ingredientViewModel.fetchCurrentSelectedRecipe(id);
            return ListenableBuilder(
              listenable: ingredientViewModel,
              builder: (context, builder) {
                return IngredientScreen(
                  ingredientViewModel: ingredientViewModel,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
