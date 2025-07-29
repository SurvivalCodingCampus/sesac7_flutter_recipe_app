import 'dart:async';

import 'package:flutter/material.dart';
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
