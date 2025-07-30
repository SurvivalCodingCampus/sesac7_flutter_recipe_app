import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_action.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/features/show_saved_recipes/presentation/screen/saved_recipes_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';

class SavedRecipesScreenRoot extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        return SavedRecipesScreen(
          state: viewModel.state,
          onAction: (action) {
            switch (action) {
              case ClickRecipeCard():
                context.push('${Routes.ingredient}/${action.recipeId}');
              case ClickBookmarkButton():
                viewModel.onAction(
                  SavedRecipesAction.clickBookmarkButton(action.id),
                );
            }
          },
        );
      },
    );
  }
}
