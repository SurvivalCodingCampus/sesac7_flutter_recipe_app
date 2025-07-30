import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_screen/saved_recipes_view_model.dart';

import '../../../data/data_source/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository_impl.dart';
import '../../component/card/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel savedRecipedViewModel;

  // 생성자로 viewModel을 주입 받음
  const SavedRecipesScreen({super.key, required this.savedRecipedViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Recipes'),
      ),
      body: ListenableBuilder(
        listenable: savedRecipedViewModel,
        builder: (context, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: savedRecipedViewModel.savedRecipes.length,
            itemBuilder: (context, index) {
              final recipe = savedRecipedViewModel.savedRecipes[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RecipeCard(
                  recipe: recipe,
                  onBookmarkPressed: () {},
                ),
              );
            },
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

  savedRecipesViewModel.fetchSavedRecipes();

  runApp(
    MaterialApp(
      home: SavedRecipesScreen(savedRecipedViewModel: savedRecipesViewModel),
    ),
  );
}
