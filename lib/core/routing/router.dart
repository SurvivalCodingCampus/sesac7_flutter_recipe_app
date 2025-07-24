import 'package:flutter_recipe_app/core/presentation/component/nav_bar/bottom_nav_bar.dart';
import 'package:flutter_recipe_app/home/presentation/screen/home_screen.dart';
import 'package:flutter_recipe_app/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:go_router/go_router.dart';
import '../../recipe_ingredients/presentation/recipe_ingredients_screen.dart';
import '../../saved_recipes/domain/use_case/fetch_recipes_use_case.dart';
import '../../saved_recipes/domain/use_case/unsaved_recipe_use_case.dart';
import '../../saved_recipes/presentation/saved_recipes_state.dart';
import '../data/data_source/remote/recipe_data_source_impl.dart';
import '../data/repository/recipes_repository_impl.dart';
import '../../home/domain/model/home_view_model.dart';
import '../../saved_recipes/presentation/saved_recipes_screen.dart';
import '../../search_recipes/presentation/search_recipe_screen.dart';
import '../../search_recipes/presentation/search_recipes_view_model.dart';
import '../../sign_in_up/presentation/screen/sign_in_screen.dart';
import '../../sign_in_up/domain/model/sign_in_view_model.dart';
import '../../sign_in_up/presentation/screen/sign_up_screen.dart';
import '../../sign_in_up/domain/model/sign_up_view_model.dart';
import 'routes.dart';
import '../presentation/screen/splash_screen/splash_screen.dart';

// Repository 이하 : 싱글톤
final recipeRepository = RecipeRepositoryImpl(
  RecipeDataSourceImpl(
      baseUrl: 'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main/recipe/recipes.json'
  ),
);

// UseCase
final _fetchRecipesUseCase = FetchRecipesUseCase(
  recipeRepository: recipeRepository,
  state: SavedRecipesState(),
);
final _unsaveRecipeUseCase = UnsavedRecipeUseCase();

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
    // recipe ingredients
    GoRoute(
      path: '${Routes.recipeIngredients}/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return RecipeIngredientsScreen(recipeId: id);
      },
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
                final savedRecipesViewModel = SavedRecipesViewModel(
                  fetchRecipesUseCase: _fetchRecipesUseCase,
                  unsaveRecipeUseCase: _unsaveRecipeUseCase,
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
                // 그림은 먼저 그리고 데이터는 받아온 상태에서 notifyListeners(); 로 상태를 업데이트 함

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
