import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/dialogs/rating_dialog.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/recipe_detail/recipe_detail_view_model.dart';

import 'recipe_detail_screen.dart';

class RecipeDetailRoot extends StatefulWidget {
  final RecipeDetailViewModel viewModel;
  final int recipeId;

  const RecipeDetailRoot({
    super.key,
    required this.viewModel,
    required this.recipeId,
  });

  @override
  State<RecipeDetailRoot> createState() => _RecipeDetailRootState();
}

class _RecipeDetailRootState extends State<RecipeDetailRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getRecipeDetailData(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return RecipeDetailScreen(
          state: widget.viewModel.state,
          onAction: (RecipeDetailAction action) {
            widget.viewModel.onAction(action);
            Future.delayed(Duration.zero, () {
              showDialog(
                context: context,
                builder: (context) => UnconstrainedBox(
                  child: RatingDialog(
                    title: "rate recipe",
                    buttonText: "send",
                    onPress: (int i) => print(i),
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}
