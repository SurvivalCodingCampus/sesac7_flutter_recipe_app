import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';

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
