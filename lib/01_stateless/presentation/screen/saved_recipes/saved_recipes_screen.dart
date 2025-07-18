import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';

import '../../../data/repository/recipe_repository_impl.dart';

void main() {
  final savedRecipesViewModel = SavedRecipesViewModel(
    recipeRepository: RecipeRepositoryImpl(
      recipeDataSource: RecipeDataSourceImpl(
        baseUrl:
            'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main',
      ),
    ),
  );
  savedRecipesViewModel.fetchRecipes();

  runApp(
    MaterialApp(
      home: ListenableBuilder(
        listenable: savedRecipesViewModel,
        builder: (context, child) {
          return SavedRecipesScreen(
            viewModel: savedRecipesViewModel,
          );
        },
      ),
    ),
  );
}

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved recipes'),
      ),
      body: _buildBody(),
    );
  }

  // 헬퍼 함수
  Widget _buildBody() {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (viewModel.errorMessage != null) {
      return Center(
        child: Text(viewModel.errorMessage!),
      );
    }
    return ListView.builder(
      itemCount: viewModel.recipes.length,
      itemBuilder: (context, index) {
        final recipe = viewModel.recipes[index];
        return RecipeCard(recipe: recipe);
      },
    );
  }
}
