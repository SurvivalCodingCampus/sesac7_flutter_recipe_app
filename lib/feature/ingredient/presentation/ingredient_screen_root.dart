import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/error_dialog.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/model/menu_item.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_action.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_event.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_screen.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';
import 'package:go_router/go_router.dart';

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
  StreamSubscription<IngredientEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init(recipeId: widget.recipeId);

    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowErrorDialog():
            showErrorDialog(context, event.message);
        }
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
                _handleMenuAction(action.item);
              default:
                viewModel.onAction(action);
            }
          },
        );
      },
    );
  }

  void _handleMenuAction(MenuItem item) {
    switch (item) {
      case MenuItem.share:
        break;
      case MenuItem.rateRecipe:
        _showRatingDialog();
      case MenuItem.review:
        break;
      case MenuItem.unsave:
        break;
    }
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return RatingDialog(
          title: 'Rate recipe',
          actionName: 'Send',
          onTapBackground: () {
            context.pop();
          },
          onTapActionButton: (int rating) {
            context.pop();
          },
        );
      },
    );
  }
}
