import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/component/title_bar/screen_title_bar.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipeViewModel _savedRecipeViewModel;
  final Function(int id) onSavedRecipeItemClick;

  const SavedRecipeScreen({
    super.key,
    required SavedRecipeViewModel savedRecipeViewModel,
    required this.onSavedRecipeItemClick,
  }) : _savedRecipeViewModel = savedRecipeViewModel;

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
                itemCount:
                    _savedRecipeViewModel.savedRecipeState.savedRecipes.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                itemBuilder: (context, index) {
                  return RecipeCard(
                    recipe:
                        _savedRecipeViewModel.savedRecipeState.savedRecipes[index],
                    onTap: onSavedRecipeItemClick,
                    onFavoritePressed: () {
                      final id = _savedRecipeViewModel.savedRecipeState.savedRecipes[index].id;
                      _savedRecipeViewModel.removeSavedRecipe(id);
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
