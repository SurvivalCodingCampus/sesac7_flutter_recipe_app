import 'package:flutter_recipe_app/presentation/component/nav_bar/bottom_nav_bar.dart';
import 'package:flutter_recipe_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/recipe_view_model.dart';
import 'package:go_router/go_router.dart';
import '../data/data_source/remote/recipe_data_source_impl.dart';
import '../data/repository/recipes_repository_impl.dart';
import '../presentation/screen/home/home_view_model.dart';
import '../presentation/screen/saved_recipes/recipe_card_screen.dart';
import '../presentation/screen/search_recipes/search_recipe_screen.dart';
import '../presentation/screen/search_recipes/search_recipes_view_model.dart';
import '../presentation/screen/sign_in/sign_in_screen.dart';
import '../presentation/screen/sign_in/sign_in_view_model.dart';
import '../presentation/screen/sign_in/sign_up_screen.dart';
import '../presentation/screen/sign_in/sign_up_view_model.dart';
import 'routes.dart';
import '../presentation/screen/splash_screen/splash_screen.dart';

final recipeRepository = RecipeRepositoryImpl(
  RecipeDataSourceImpl(
      baseUrl: 'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json'
  ),
);

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignInScreen(
        viewModel: SignInViewModel(),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpScreen(
        viewModel: SignUpViewModel(),
      ),
    ),

    // 탭 영역 BottomNavBar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onTap: (int index) {
            navigationShell.goBranch(index);
          },
        );
      },
      branches: [
        // 1번 탭: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => HomeScreen(
                viewModel: HomeViewModel(),
              ),
            ),
          ],
        ),

        // 2번 탭: Saved
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final savedRecipesViewModel = RecipeCardViewModel(
                  repository: recipeRepository,
                );
                savedRecipesViewModel.fetchRecipes();
                return RecipeCardScreen(
                  viewModel: savedRecipesViewModel,
                );
              }
            ),
          ],
        ),

        // 3번 탭: Search
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.searchRecipes,
              builder: (context, state) {
                final searchRecipesViewModel = SearchRecipesViewModel(
                  repository: recipeRepository,
                );
                searchRecipesViewModel.loadRecipes();

                return SearchRecipeScreen(
                  viewModel: searchRecipesViewModel,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
