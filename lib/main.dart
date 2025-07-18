import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/splash_screen.dart';
import 'package:flutter_recipe_app/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/view_model/recipe_view_model.dart';

import 'data_source/mock_recipe_data_source_impl.dart';

void main() {
  final recipeViewModel = RecipeViewModel(
    RecipeRepositoryImpl(MockRecipeDataSource()),
  );

  recipeViewModel.fetchRecipes();

  runApp(MyApp(recipeViewModel: recipeViewModel,));
}

class MyApp extends StatelessWidget {
  final RecipeViewModel recipeViewModel;

  const MyApp({super.key, required this.recipeViewModel});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SavedRecipesScreen(recipeViewModel: recipeViewModel),
    );
  }
}
