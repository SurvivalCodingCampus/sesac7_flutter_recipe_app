import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/saved_recipes_viewmodel.dart';
import '../../components/card/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Saved recipes'),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (BuildContext context, Widget? child) {
          final savedRecipes = viewModel.getSavedRecipes();
          if (savedRecipes.isEmpty) {
            return const Center(child: Text('저장된 레시피가 없습니다.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            itemCount: savedRecipes.length,
            itemBuilder: (BuildContext context, int index) {
              final recipe = savedRecipes[index];
              final user = viewModel.getUserById(recipe.userId);
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: RecipeCard(
                  recipe: recipe,
                  user: user,
                  viewModel: viewModel,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
