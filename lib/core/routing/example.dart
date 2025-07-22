// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';
//
//
// // Repository 이하 : 싱글톤
// final RecipeRepository recipeRepository = MockRecipeRepositoryImpl();
//
// // ViewModel : Factory
//
// final router = GoRouter(
//   initialLocation: Routes.main,
//   routes: [
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) {
//         return TabScreen(
//           body: navigationShell,
//           currentIndex: navigationShell.currentIndex,
//           onTap: (int index) {
//             navigationShell.goBranch(index);
//           },
//         );
//       },
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: Routes.main,
//               builder: (context, state) {
//                 final mainViewModel = MainViewModel(
//                   personRepository: PersonRepositoryImpl(),
//                 );
//                 mainViewModel.fetchPersonData();
//                 return ListenableBuilder(
//                   listenable: mainViewModel,
//                   builder: (context, child) {
//                     return MainScreen(
//                       viewModel: mainViewModel,
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: Routes.savedRecipes,
//               builder: (context, state) {
//                 final savedRecipesViewModel = SavedRecipesViewModel(
//                   recipeRepository: recipeRepository,
//                 );
//                 savedRecipesViewModel.fetchRecipes();
//                 return ListenableBuilder(
//                   listenable: savedRecipesViewModel,
//                   builder: (context, child) {
//                     return SavedRecipesScreen(
//                       viewModel: savedRecipesViewModel,
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: Routes.searchRecipes,
//               builder: (context, state) {
//                 final searchRecipesViewModel = SearchRecipesViewModel(
//                   recipeRepository: recipeRepository,
//                 );
//
//                 searchRecipesViewModel.fetchRecipes();
//                 return ListenableBuilder(
//                   listenable: searchRecipesViewModel,
//                   builder: (context, child) {
//                     return SearchRecipesScreen(
//                       viewModel: searchRecipesViewModel,
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: Routes.main,
//               builder: (context, state) {
//                 final mainViewModel = MainViewModel(
//                   personRepository: PersonRepositoryImpl(),
//                 );
//                 mainViewModel.fetchPersonData();
//                 return ListenableBuilder(
//                   listenable: mainViewModel,
//                   builder: (context, child) {
//                     return MainScreen(
//                       viewModel: mainViewModel,
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );