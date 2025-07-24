import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/domain/use_case/filter_recipes_use_case.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/ingredient/ingredient_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/mock/mock_recipe_repository_impl.dart';
import '../../data/repository/person_repository_impl.dart';
import '../../domain/model/recipe.dart';
import '../../domain/repository/recipe_repository.dart';
import '../../domain/use_case/fetch_recipes_use_case.dart';
import '../../domain/use_case/get_recipe_use_case.dart';
import '../../domain/use_case/search_recipes_use_case.dart';
import '../../presentation/screen/ingredient/ingredient_screen.dart';
import '../../presentation/screen/main/main_screen.dart';
import '../../presentation/screen/main/main_view_model.dart';
import '../../presentation/screen/saved_recipes/saved_recipes_screen.dart';
import '../../presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import '../../presentation/screen/search_recipes/search_recipes_screen.dart';
import '../../presentation/screen/search_recipes/search_recipes_view_model.dart';
import '../../presentation/screen/tab/tab_screen.dart';

// Repository 이하 : 싱글톤
final RecipeRepository _recipeRepository = MockRecipeRepositoryImpl();

// UseCase
final _fetchRecipesUseCase = GetRecipesUseCase(
  recipeRepository: _recipeRepository,
);
final _getRecipeUseCase = GetRecipeUseCase(
  recipeRepository: _recipeRepository,
);

final _filterRecipesUseCase = FilterRecipesUseCase();
final _searchRecipesUseCase = SearchRecipesUseCase(
  filterRecipesUseCase: _filterRecipesUseCase,
);

// ViewModel : Factory

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

        final viewModel = IngredientViewModel(
          getRecipeUseCase: _getRecipeUseCase,
        );
        viewModel.fetchRecipe(int.parse(id));

        return ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return IngredientScreen(
              viewModel: viewModel,
            );
          },
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabScreen(
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
                final savedRecipesViewModel = SavedRecipesViewModel(
                  fetchRecipesUseCase: _fetchRecipesUseCase,
                );
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
                final searchRecipesViewModel = SearchRecipesViewModel(
                  getRecipesUseCase: _fetchRecipesUseCase,
                  searchRecipesUseCase: _searchRecipesUseCase,
                );

                searchRecipesViewModel.fetchRecipes();
                return ListenableBuilder(
                  listenable: searchRecipesViewModel,
                  builder: (context, child) {
                    return SearchRecipesScreen(
                      viewModel: searchRecipesViewModel,
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
