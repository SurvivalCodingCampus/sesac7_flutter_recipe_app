import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/join_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe_screen_root.dart';
import 'package:flutter_recipe_app/presentation/screen/splash_screen.dart';
import 'package:flutter_recipe_app/presentation/view_model/search_recipe_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../di/di_setup.dart';
import '../../presentation/component/bottom_nav/Custom_bottom_navigate.dart';
import '../../presentation/screen/action/search_recipes_action.dart';
import '../../presentation/screen/filter_search_bottom_sheet.dart';
import '../../presentation/screen/login_screen.dart';
import '../../presentation/screen/main_screen_root.dart';
import '../../presentation/screen/recipe_detail_screen.dart';
import '../../presentation/screen/saved_recipes_screen_root.dart';
import '../../presentation/state_holder/filter_search_state.dart';
import '../../presentation/view_model/filter_search_bottom_sheet_view_model.dart';
import '../../presentation/view_model/recipe_view_model.dart';
import 'routes.dart';

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
                return MainScreenRoot(homeRecipeViewModel: getIt());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                RecipeViewModel recipeViewModel = getIt();
                recipeViewModel.fetchRecipes();

                return SavedRecipesScreenRoot(
                  recipeViewModel: recipeViewModel,
                );
              },
              routes: [
                GoRoute(
                  path: Routes.recipesDetailRelative,
                  builder: (context, state) {
                    //final recipe = state.extra as Recipe;
                    String recipeId = state.pathParameters['id']!;

                    return RecipeDetailScreen(
                      recipeDetailViewModel: getIt(),
                      recipeId: recipeId,
                    );
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

                final searchRecipesViewModel = getIt<SearchRecipeViewModel>();
                final filterViewModel = getIt<FilterSearchBottomSheetViewModel>(); // 구조적 문제(고처야 합니다.)

                searchRecipesViewModel.onAction(SearchRecipesAction.onFetchRecipes());
                return SearchRecipeScreenRoot(
                  searchRecipeViewModel: searchRecipesViewModel,
                  onCallFilterBottomSheet: () async {
                    final result = await _showFilterBottomSheet(
                      context,
                      filterViewModel,
                    );

                    searchRecipesViewModel.onAction(SearchRecipesAction.onSavedFilterStatue(result));
                  },
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


// 필터 화면을 바텀 시트로 띄우는 함수
Future<FilterSearchState> _showFilterBottomSheet(
    BuildContext context,
    FilterSearchBottomSheetViewModel filterViewModel,
    ) async {
  return await showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    isScrollControlled: true,
    // 바텀 시트가 화면 전체 높이까지 확장될 수 있도록 설정
    backgroundColor: Colors.transparent,
    // 배경을 투명하게 하여 모서리 둥글게 처리가 잘 보이도록 함
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        // 초기 바텀 시트 높이 (화면 높이의 70%)
        minChildSize: 0.5,
        // 최소 높이
        maxChildSize: 0.9,
        // 최대 높이
        expand: false,
        // 화면 전체로 확장될지 여부 (여기서는 false로 DraggableScrollableSheet 사용)
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white, // 바텀 시트의 실제 배경색
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ), // 상단 모서리 둥글게
            ),
            child: ClipRRect(
              // 둥근 모서리 내부 콘텐츠도 잘리도록 ClipRRect 사용
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
              child: FilterSearchBottomSheet(
                scrollController: scrollController,
                filterViewModel: filterViewModel,
                onFilterSelected: (FilterSearchState filterSearchState) {
                  // 필터 선택 시 호출되는 콜백
                  Navigator.pop(context, filterSearchState);
                },
              ), // 필터 화면 전달
            ),
          );
        },
      );
    },
  );
}