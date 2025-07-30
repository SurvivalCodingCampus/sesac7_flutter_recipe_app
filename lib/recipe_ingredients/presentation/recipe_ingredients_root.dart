import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_action.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_event.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_screen.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_view_model.dart';

import '../domain/model/recipe_menu_item.dart';

class RecipeIngredientsRoot extends StatefulWidget {
  final RecipeIngredientsViewModel viewModel;

  const RecipeIngredientsRoot({super.key, required this.viewModel});

  @override
  State<RecipeIngredientsRoot> createState() => _RecipeIngredientsRootState();
}

class _RecipeIngredientsRootState extends State<RecipeIngredientsRoot> {
  StreamSubscription? _eventSubscription;

  @override
  void initState() {
    super.initState();
    _eventSubscription = widget.viewModel.eventStream.listen((event) async {
      if (mounted) {
        switch (event) {
          case ShowRatingDialog():
            await showDialog(
              context: context,
              builder: (context) {
                return RatingDialog(
                  title: 'Rate this recipe',
                  actionName: 'Submit',
                  onChange: (rating) {
                    print('선택된 평점: $rating');
                    Navigator.of(context).pop();
                  },
                );
              },
            );
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RecipeIngredientsScreen(
      viewModel: widget.viewModel,
      onAction: widget.viewModel.onAction,
    );
  }
}
