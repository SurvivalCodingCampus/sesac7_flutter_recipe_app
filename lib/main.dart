import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/mock_saved_recipes_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_screen.dart';

import '01_stateless/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import '01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';

void main() {
  final savedRecipesViewModel = SavedRecipesViewModel(
    repo: MockSavedRecipesRepositoryImpl(),
  );
  savedRecipesViewModel.fetchRecipeData();

  runApp(
    MyApp(
      savedRecipesViewModel: savedRecipesViewModel,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const MyApp({
    super.key,
    required this.savedRecipesViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipe App Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListenableBuilder(listenable: savedRecipesViewModel, builder: (context, child) {
        return SavedRecipesScreen(
          viewModel: savedRecipesViewModel,
        );
      },
      ),
    );
  }
}
