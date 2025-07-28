import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_view_model.dart';

class IngredientScreenRoot extends StatefulWidget {
  final int? _id;
  final IngredientViewModel _ingredientViewModel;
  final VoidCallback onIngredientScreenBackButtonClick;

  const IngredientScreenRoot(
    IngredientViewModel ingredientViewModel, {
    super.key,
    int? id,
    required this.onIngredientScreenBackButtonClick,
  }) : _ingredientViewModel = ingredientViewModel,
       _id = id;

  @override
  State<IngredientScreenRoot> createState() => _IngredientScreenRootState();
}

class _IngredientScreenRootState extends State<IngredientScreenRoot> {
  @override
  void initState() {
    super.initState();
    if (widget._id != null) {
      widget._ingredientViewModel.fetchCurrentSelectedRecipe(widget._id!);
      widget._ingredientViewModel.fetchCurrentSelectedRecipeProcedures(
        widget._id!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._ingredientViewModel,
      builder: (context, value, child) {
        return IngredientScreen(
          ingredientState: value,
          onAction: (action) {
            if (action is ClickIngredientBackButton) {
              widget.onIngredientScreenBackButtonClick();
            } else {
              widget._ingredientViewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
