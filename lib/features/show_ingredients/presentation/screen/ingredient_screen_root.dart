import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../presentation/component/rating_dialog.dart';
import '../component/custom_menu_tab.dart';
import 'ingredient_action.dart';
import 'ingredient_event.dart';
import 'ingredient_screen.dart';
import 'ingredient_screen_view_model.dart';

class IngredientScreenRoot extends StatefulWidget {
  final IngredientScreenViewModel viewModel;

  const IngredientScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<IngredientScreenRoot> createState() => _IngredientScreenRootState();
}

class _IngredientScreenRootState extends State<IngredientScreenRoot> {
  StreamSubscription<IngredientEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewModel.events.listen((event) {
      switch (event) {
        case ShowMenuTab():
          _showMenuTab();
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (BuildContext context, Widget? child) {
        return IngredientScreen(
          state: widget.viewModel.state,
          onAction: (IngredientAction action) {
            switch (action) {
              case ClickBackButton():
                Navigator.pop(context);
              case SwitchTab():
                widget.viewModel.onAction(
                  IngredientAction.switchTab(action.index),
                );
              case ClickMenuButton():
                widget.viewModel.onAction(IngredientAction.clickMenuButton());
            }
          },
        );
      },
    );
  }

  void _showMenuTab() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: CustomMenuTab(
            onSelectMenuItem: (index) {
              switch (index) {
                case 1:
                  _showRatingDialog();
              }
            },
          ),
        );
      },
    );
  }

  void _showRatingDialog() {
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
