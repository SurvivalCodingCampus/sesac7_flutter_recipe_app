import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/recipe_detail_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/saved_recipes_viewmodel.dart';
import 'package:go_router/go_router.dart';
import '../data/repository/recipe_repository_impl.dart';
import '../data/repository/user_repository_impl.dart';
import '../domain/use_case/get_recipes_use_case.dart';
import '../domain/use_case/get_users_use_case.dart';
import '../domain/use_case/toggle_bookmark_use_case.dart';
import '../presentation/screen/shell/shell_screen.dart';

final userRepository = UserRepositoryImpl();
final recipeRepository = RecipeRepositoryImpl();

final getUsersUseCase = GetUsersUseCase(userRepository);
final getRecipesUseCase = GetRecipesUseCase(recipeRepository);
final toggleBookmarkUseCase = ToggleBookmarkUseCase();

final savedRecipesViewModel = SavedRecipesViewModel(
  getUsersUseCase: getUsersUseCase,
  getRecipesUseCase: getRecipesUseCase,
  toggleBookmarkUseCase: toggleBookmarkUseCase,
);

final router = GoRouter(
  initialLocation: '/saved',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ShellScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) =>
                  const Center(child: Text('Home Screen')),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved',
              builder: (context, state) {
                return SavedRecipesScreen(viewModel: savedRecipesViewModel);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) =>
                  const Center(child: Text('Notifications Screen')),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) =>
                  const Center(child: Text('Profile Screen')),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        final String recipeId = state.pathParameters['id']!;
        final recipe = savedRecipesViewModel.state.recipes.firstWhere(
          (r) => r.id == recipeId,
          orElse: () => savedRecipesViewModel.state.recipes.first,
        );
        final user = savedRecipesViewModel.getUserById(recipe.userId);
        return RecipeDetailScreen(
          recipe: recipe,
          user: user,
          viewModel: savedRecipesViewModel,
        );
      },
    ),
  ],
);
