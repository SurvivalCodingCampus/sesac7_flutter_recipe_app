import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';

void main() async {
  // runApp(const MyApp());
  final SavedRecipeViewModel savedRecipeViewModel = SavedRecipeViewModel(
    RecipeRepositoryImpl(RecipeDataSourceImpl()),
  );
  await savedRecipeViewModel.fetchRecipes();

  runApp(
    SavedRecipeApp(
      savedRecipeViewModel: savedRecipeViewModel,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainScreen(),
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
        if (_savedRecipeViewModel.recipes.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SavedRecipeScreen(savedRecipeViewModel: _savedRecipeViewModel);
      })
    );
  }
}
