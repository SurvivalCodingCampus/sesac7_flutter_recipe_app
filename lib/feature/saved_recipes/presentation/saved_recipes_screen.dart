import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/recipe_card.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_action.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_state.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesState state;
  final void Function(SavedRecipesAction action) onAction;

  const SavedRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: TextStyles.mediumTextBold,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
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
                onTap: () {
                  onAction(SavedRecipesAction.tapRecipeCard(recipe.id));
                },
                onBookmarkTap: () {
                  onAction(SavedRecipesAction.tapRecipeBookmark(recipe.id));
                },
              );
            },
          );
        },
      ),
    );
  }
}
