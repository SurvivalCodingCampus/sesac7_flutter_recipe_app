import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

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
          onSavedRecipeItemClick: widget.moveSavedRecipeDetail,
          savedRecipeFavoriteStateChange: (index) {
            // fixme 현재는 무조건 삭제
            final id = value.savedRecipes[index].id;
            widget._savedRecipeViewModel.removeSavedRecipe(id);
          },
        );
      },
    );
  }
}
