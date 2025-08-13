import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_source/recipe_data_source_impl.dart';
import '../../presentation/screen/create_account/create_account_screen.dart';
import '../../presentation/screen/main_screen.dart';
import '../../presentation/screen/saved_screen/saved_recipes_screen.dart';
import '../../presentation/screen/saved_screen/saved_recipes_view_model.dart';
import '../../presentation/screen/search_screen/search_recipes_screen.dart';
import '../../presentation/screen/search_screen/search_recipes_view_model.dart';
import '../../presentation/screen/sign_in/sign_in_screen.dart';
import '../../presentation/screen/tap_screen/tap_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    GoRoute(
      path: Routes.signInScreen,
      builder: (context, state){
        return LoginScreen();
      },
    ),

    GoRoute(
      path: Routes.signUpScreen,
      builder: (context, state){
        return CreateAccountScreen();
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        //context: 현재 위젯의 위치 정보. state: 현재 경로의 상태 정보. navigationShell: 탭바의 내용을 담고 있는 특별한 객체
        return TabScreen(
          navigationShell: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) {
            navigationShell.goBranch(index);
          },
        );
      },
      // branches: 탭바의 각 버튼에 해당하는 화면들을 정의
      branches: [
        // 첫 번째 탭: 메인 화면
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.mainScreen,
              builder: (context, state) => const MainScreen(),
            ),
          ],
        ),
        // 두 번째 탭: 북마크 목록 화면
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipesScreen,
              builder: (context, state) {
                final savedRecipesViewModel = SavedRecipesViewModel(
                  recipeRepository: RecipeRepositoryImpl(
                    RecipeDataSourceImpl(),
                  ),
                );
                savedRecipesViewModel.fetchSavedRecipes();
                return ListenableBuilder(
                  listenable: savedRecipesViewModel,
                  builder: (context, child) {
                    return SavedRecipesScreen(
                      savedRecipesViewModel: savedRecipesViewModel,
                    );
                  },
                );
              },
            ),
          ],
        ),
        // 세 번째 탭: 검색 화면
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.searchRecipesScreen,
              builder: (context, state) {
                final searchRecipesViewModel = SearchRecipesViewModel(
                  recipeRepository: RecipeRepositoryImpl(
                    RecipeDataSourceImpl(),
                  ),
                );
                searchRecipesViewModel.fetchSearchRecipes();
                return ListenableBuilder(
                  listenable: searchRecipesViewModel,
                  builder: (context, child) {
                    return SearchRecipesScreen(
                      searchRecipesViewModel: searchRecipesViewModel,
                    );
                  },
                );
              },
            ),
          ],
        ),
        // 네 번째 탭: 프로필 화면 -> splash로 대체
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) {
                return SplashScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
