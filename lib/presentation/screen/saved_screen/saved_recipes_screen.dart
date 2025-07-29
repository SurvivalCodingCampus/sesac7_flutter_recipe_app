import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_screen/saved_recipes_view_model.dart';

import '../../../data/data_source/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository_impl.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel savedRecipedViewModel;

  // 생성자로 viewModel을 주입 받음
  const SavedRecipesScreen({super.key, required this.savedRecipedViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListenableBuilder(
        listenable: savedRecipedViewModel,
        builder: (context, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                    'Recipes: ${savedRecipedViewModel.rawResultString}'
                  ),
                ),
            ),
          );
        },
      ),
    );
  }
}

void main() async {
  final savedRecipesViewModel = SavedRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      RecipeDataSourceImpl(),
    ),
  );

  await (savedRecipesViewModel.fetchSavedRecipes() as Future<void>);

  runApp(
    MaterialApp(
      home: SavedRecipesScreen(savedRecipedViewModel: savedRecipesViewModel),
    ),
  );
}
