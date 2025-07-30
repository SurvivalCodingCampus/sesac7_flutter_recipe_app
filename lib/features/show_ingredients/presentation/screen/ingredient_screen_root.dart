import 'package:flutter/material.dart';

import '../../../../presentation/component/rating_dialog.dart';
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
              case ClickMenuButton():
                viewModel.onAction(IngredientAction.clickMenuButton());
              case ClickMenuItem():
                if (action.index == 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        content: Align(
                          heightFactor: 1,
                          child: RatingDialog(
                            title: 'Rate recipe',
                            actionName: 'Send',
                            onChange: (int rating) {
                              print('현재 선택된 점수는 $rating점 입니다.');
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}
