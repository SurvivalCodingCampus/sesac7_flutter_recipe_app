import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_action.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_screen.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';

class IngredientScreenRoot extends StatefulWidget {
  final String recipeId;
  final IngredientViewModel viewModel;
  final VoidCallback onTapBack;

  const IngredientScreenRoot({
    super.key,
    required this.recipeId,
    required this.viewModel,
    required this.onTapBack,
  });

  @override
  State<IngredientScreenRoot> createState() => _IngredientScreenRootState();
}

class _IngredientScreenRootState extends State<IngredientScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.init(recipeId: widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return IngredientScreen(
          state: viewModel.state,
          onAction: (action) {
            switch (action) {
              case TapBack():
                widget.onTapBack();
              case TapMenu():
                // TODO: tap menu.
                print(action);
              default:
                viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
