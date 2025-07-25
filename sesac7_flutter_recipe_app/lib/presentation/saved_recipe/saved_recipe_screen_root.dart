import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

import 'saved_recipe_action.dart';

class SavedRecipeScreenRoot extends StatefulWidget {
  final SavedRecipeViewModel _savedRecipeViewModel;
  final Function(int recipeId) moveSavedRecipeDetail;

  const SavedRecipeScreenRoot(
    SavedRecipeViewModel savedRecipeViewModel, {
    super.key,
    required this.moveSavedRecipeDetail,
  }) : _savedRecipeViewModel = savedRecipeViewModel;

  @override
  State<SavedRecipeScreenRoot> createState() => _SavedRecipeScreenRootState();
}

class _SavedRecipeScreenRootState extends State<SavedRecipeScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget._savedRecipeViewModel.fetchSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._savedRecipeViewModel,
      builder: (context, value, child) {
        return SavedRecipeScreen(
          savedRecipeState: value,
          onAction: (action) {
            if (action is MoveSavedRecipeIngredientScreen) {
              widget.moveSavedRecipeDetail(action.id);
            } else {
              widget._savedRecipeViewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
