import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipeViewModel _savedRecipeViewModel;

  const SavedRecipeScreen({
    super.key,
    required SavedRecipeViewModel savedRecipeViewModel,
  }) : _savedRecipeViewModel = savedRecipeViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: TextStyles.savedRecipeScreenTitle,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: _savedRecipeViewModel.recipes.length,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return RecipeCard(
                    recipe: _savedRecipeViewModel.recipes[index],
                    onFavoritePressed: () {},
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
