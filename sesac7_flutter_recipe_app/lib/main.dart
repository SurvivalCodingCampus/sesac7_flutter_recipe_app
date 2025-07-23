import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

void main() async {
  runApp(const MyApp());
  // fixme SavedRecipeScreen 용
  // final SavedRecipeViewModel savedRecipeViewModel = SavedRecipeViewModel(
  //   RecipeRepositoryImpl(RecipeDataSourceImpl()),
  // );
  // await savedRecipeViewModel.fetchRecipes();
  //
  // runApp(
  //   SavedRecipeApp(
  //     savedRecipeViewModel: savedRecipeViewModel,
  //   ),
  // );
  // fixme SearchRecipeScreen 용
  // final SearchRecipeViewModel searchRecipeViewModel = SearchRecipeViewModel(
  //   recipeRepository: RecipeRepositoryImpl(RecipeDataSourceImpl()),
  // );
  // await searchRecipeViewModel.fetchRecentRecipes();
  //
  // runApp(
  //   SearchRecipeApp(
  //     searchRecipeViewModel: searchRecipeViewModel,
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white, surface: AppColors.white),
      ),
      routerConfig: router,
    );
  }
}

class SavedRecipeApp extends StatelessWidget {
  final SavedRecipeViewModel _savedRecipeViewModel;

  const SavedRecipeApp({
    super.key,
    required SavedRecipeViewModel savedRecipeViewModel,
  }) : _savedRecipeViewModel = savedRecipeViewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SplashScreen(),
      home: ListenableBuilder(listenable: _savedRecipeViewModel, builder: (context, build) {
        if (_savedRecipeViewModel.savedRecipeState.recipes.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SavedRecipeScreen(savedRecipeViewModel: _savedRecipeViewModel);
      })
    );
  }
}

class SearchRecipeApp extends StatelessWidget {
  final SearchRecipesViewModel _searchRecipeViewModel;

  const SearchRecipeApp({
    super.key,
    required SearchRecipesViewModel searchRecipeViewModel,
  }) : _searchRecipeViewModel = searchRecipeViewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: SplashScreen(),
        home: ListenableBuilder(listenable: _searchRecipeViewModel, builder: (context, build) {
          if (_searchRecipeViewModel.searchRecipesState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SearchRecipesScreen(searchRecipeViewModel: _searchRecipeViewModel);
        })
    );
  }
}
