import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/query_parameters.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/core/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/core/data/repository/recipe/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/feature/authentication/presentation/sign_in_screen.dart';
import 'package:flutter_recipe_app/feature/authentication/presentation/sign_up_screen.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_screen.dart';
import 'package:flutter_recipe_app/feature/ingredient/data/repository/mocks/mock_ingredient_repository_impl.dart';
import 'package:flutter_recipe_app/feature/ingredient/data/repository/mocks/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_all_ingredients_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_procedure_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/fetch_recipe_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/use_case/format_review_count_use_case.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_screen.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';
import 'package:flutter_recipe_app/feature/main_navigation/presentation/main_navigation_screen.dart';
import 'package:flutter_recipe_app/feature/notifications/presentation/notifications_screen.dart';
import 'package:flutter_recipe_app/feature/profile/presentation/profile_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/data/repository/mock/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

// Repository
final _recipeRepository = RecipeRepositoryImpl(
  recipeDataSource: RecipeDataSourceImpl(),
);

final _mockBookmarkRepository = MockBookmarkRepositoryImpl();

final _mockIngredientRespository = MockIngredientRepositoryImpl();

final _mockProcedureRepository = MockProcedureRepositoryImpl();

// Use Case
final _getSavedRecipesUseCase = GetSavedRecipesUseCase(
  recipeRepository: _recipeRepository,
  bookmarkRepository: _mockBookmarkRepository,
);

final _fetchRecipeUseCase = FetchRecipeUseCase(
  recipeRepository: _recipeRepository,
);

final _fetchAllIngredientsUseCase = FetchAllIngredientsUseCase(
  ingredientRepository: _mockIngredientRespository,
);

final _fetchProcedureUseCase = FetchProcedureUseCase(
  procedureRepository: _mockProcedureRepository,
);

final _formatReviewCountUseCase = FormatReviewCountUseCase();

GoRouter createRouter() => GoRouter(
  // initialLocation: Routes.splash,
  initialLocation: Routes.savedRecipes,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen(
          onStartCookingTap: () => context.go(Routes.signIn),
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          onSignInTap: () => context.go(Routes.home),
          onSignUpTap: () => context.go(Routes.signUp),
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          onSignInTap: () => context.go(Routes.signIn),
        );
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationScreen(
          currentIndex: navigationShell.currentIndex,
          onTabSelected: navigationShell.goBranch,
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final viewModel = SavedRecipesViewModel(
                  getSavedRecipesUseCase: _getSavedRecipesUseCase,
                  bookmarkRepository: _mockBookmarkRepository,
                );

                viewModel.fetchSavedRecipes();

                return ListenableBuilder(
                  listenable: viewModel,
                  builder: (context, child) {
                    return SavedRecipesScreen(
                      viewModel: viewModel,
                      onRecipeCardTap: (String id) {
                        context.push(
                          Uri(
                            path: Routes.ingredient,
                            queryParameters: {QueryParameters.id: id},
                          ).toString(),
                        );
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
              path: Routes.notifications,
              builder: (context, state) {
                return const NotificationsScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final id = state.uri.queryParameters[QueryParameters.id]!;
        final viewModel = IngredientViewModel(
          recipeId: id,
          fetchRecipeUseCase: _fetchRecipeUseCase,
          fetchAllIngredientsUseCase: _fetchAllIngredientsUseCase,
          fetchProcedureUseCase: _fetchProcedureUseCase,
          formatReviewCountUseCase: _formatReviewCountUseCase,
        );

        // viewModel.fetchRecipe();
        // viewModel.fetchIngredients();
        // viewModel.fetchProcedure();
        viewModel.init();

        return ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return IngredientScreen(
              viewModel: viewModel,
              onBackTap: () => context.pop(),
              onMenuTap: () {},
            );
          },
        );
      },
    ),
  ],
);
