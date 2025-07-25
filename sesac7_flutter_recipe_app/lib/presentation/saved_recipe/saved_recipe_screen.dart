import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_state.dart';

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipeState _savedRecipeState;
  final Function(int id) onSavedRecipeItemClick;
  final Function(int id) savedRecipeFavoriteStateChange;

  const SavedRecipeScreen({
    super.key,
    required SavedRecipeState savedRecipeState,
    required this.onSavedRecipeItemClick,
    required this.savedRecipeFavoriteStateChange,
  }) : _savedRecipeState = savedRecipeState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScreenTitleBar(
              title: 'Saved recipes',
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _savedRecipeState.savedRecipes.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                itemBuilder: (context, index) {
                  return RecipeCard(
                    recipe: _savedRecipeState.savedRecipes[index],
                    isBookmark: true,
                    onTap: onSavedRecipeItemClick,
                    onFavoritePressed: () {
                      savedRecipeFavoriteStateChange(index);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20.0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
