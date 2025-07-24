import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/screen/join_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/splash_screen.dart';
import 'package:flutter_recipe_app/presentation/view_model/search_recipe_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_source/recipe_data_source_impl.dart';
import '../../data/repository/ingrident_repository_impl.dart';
import '../../data/repository/procedure_repository_impl.dart';
import '../../data/repository/recipe_repository_impl.dart';
import '../../domain/repository/ingrident_repository.dart';
import '../../domain/repository/procedure_repository.dart';
import '../../domain/use_case/get_ingrident_use_case.dart';
import '../../domain/use_case/get_procedure_use_case.dart';
import '../../domain/use_case/get_recipe_by_recipe_id.dart';
import '../../domain/use_case/get_recipes_remove_by_recipe_id.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/component/bottom_nav/Custom_bottom_navigate.dart';
import '../../presentation/screen/login_screen.dart';
import '../../presentation/screen/main_screen.dart';
import '../../presentation/screen/recipe_detail_screen.dart';
import '../../presentation/view_model/filter_search_bottom_sheet_view_model.dart';
import '../../presentation/view_model/recipe_detail_view_model.dart';
import '../../presentation/view_model/recipe_view_model.dart';
import 'routes.dart';

final _recipeDataSource = RecipeDataSourceImpl();
final _recipeRepository = RecipeRepositoryImpl(_recipeDataSource);
// Use Case
final _getSavedRecipesUseCase = GetSavedRecipesUseCase(
  recipeRepository: _recipeRepository,
);
final _getRecipesRemoveByRecipeId = GetRecipesRemoveByRecipeId();
final _getRecipeByRecipeId = GetRecipeByRecipeId();

final savedRecipesViewModel = RecipeViewModel(
  getSavedRecipesUseCase: _getSavedRecipesUseCase,
  getRecipesRemoveByRecipeId: _getRecipesRemoveByRecipeId,
  getRecipeByRecipeId: _getRecipeByRecipeId,
);

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
                savedRecipesViewModel.fetchRecipes();
                return SavedRecipesScreen(
                  recipeViewModel: savedRecipesViewModel,
                );
              },
              routes: [
                GoRoute(
                  path: Routes.recipesDetailRelative,
                  builder: (context, state) {
                    final recipe = state.extra as Recipe;

                    IngridentRepository ingridentRepository = IngridentRepositoryImpl(recipe);
                    final GetIngredientsUseCase getIngredientsUseCase = GetIngredientsUseCase(ingridentRepository: ingridentRepository);

                    ProcedureRepository procedureRepository = ProcedureRepositoryImpl(recipe);
                    final GetProcedureUseCase getProcedureUseCase = GetProcedureUseCase(procedureRepository: procedureRepository);

                    final RecipeDetailViewModel recipeDetailViewModel = RecipeDetailViewModel(recipe: recipe, getIngredientsUseCase: getIngredientsUseCase, getProcedureUseCase: getProcedureUseCase);

                    return RecipeDetailScreen(recipeDetailViewModel: recipeDetailViewModel);
                  },
                ),
              ],
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
                final searchRecipesViewModel = SearchRecipeViewModel(
                  recipeRepository: recipeRepository,
                );

                final filterViewModel = FilterSearchBottomSheetViewModel();

                searchRecipesViewModel.fetchRecipes();
                return SearchRecipeScreen(
                  searchRecipeViewModel: searchRecipesViewModel,
                  filterViewModel: filterViewModel,
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
                return Container();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
