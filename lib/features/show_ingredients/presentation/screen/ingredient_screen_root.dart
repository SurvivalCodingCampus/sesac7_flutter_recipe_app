import 'package:flutter/material.dart';

import 'ingredient_action.dart';
import 'ingredient_screen.dart';
import 'ingredient_screen_view_model.dart';

class IngredientScreenRoot extends StatelessWidget {
  final IngredientScreenViewModel viewModel;

  const IngredientScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        return IngredientScreen(
          state: viewModel.state,
          onAction: (IngredientAction action) {
            switch (action) {
              case ClickBackButton():
                Navigator.pop(context);
              case SwitchTab():
                viewModel.onAction(IngredientAction.switchTab(action.index));
            }
          },
        );
      },
    );
  }
}
