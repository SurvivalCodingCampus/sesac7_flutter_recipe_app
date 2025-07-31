import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/error_dialog.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_action.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_event.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;
  final void Function(String recipeId) onTapRecipeCard;

  const SavedRecipesScreenRoot({
    super.key,
    required this.viewModel,
    required this.onTapRecipeCard,
  });

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  StreamSubscription<SavedRecipesEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init();

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
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SavedRecipesScreen(
          state: viewModel.state,
          onAction: (action) {
            switch (action) {
              case TapRecipeCard():
                widget.onTapRecipeCard(action.recipeId);
              default:
                viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
