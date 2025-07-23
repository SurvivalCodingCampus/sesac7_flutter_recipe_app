import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_card.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: TextStyles.mediumTextBold,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: TextStyles.mediumTextRegular,
              ),
            );
          }

          if (state.savedRecipes.isEmpty) {
            return Center(
              child: Text(
                'No saved recipes found.',
                style: TextStyles.mediumTextRegular,
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: state.savedRecipes.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final recipe = state.savedRecipes[index];

              return RecipeCard(
                recipe: recipe,
                onBookmarkTap: () => viewModel.removeSavedRecipe(recipe.id),
              );
            },
          );
        },
      ),
    );
  }
}
