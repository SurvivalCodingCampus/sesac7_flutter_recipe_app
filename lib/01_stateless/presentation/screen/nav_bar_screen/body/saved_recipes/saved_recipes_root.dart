import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_body.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/saved_recipes/saved_recipes_view_model.dart';
import 'package:go_router/go_router.dart';

class SavedRecipesRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SavedRecipesRoot> createState() => _SavedRecipesRootState();
}

class _SavedRecipesRootState extends State<SavedRecipesRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchBookmarkedRecipeData();
  }


  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SavedRecipesBody(
          state: widget.viewModel.state,
          onAction: (SavedRecipesAction action) {
            widget.viewModel.onAction(action);
            if(action is ClickOnRecipe) {
              context.push('${Routes.recipeDetail}/${action.recipeId}');
            }
          }
        );
      },
    );
  }
}
