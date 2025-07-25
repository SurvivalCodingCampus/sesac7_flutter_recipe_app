import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_body.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/nav_bar_screen/body/main/main_view_model.dart';
import 'package:go_router/go_router.dart';

class MainRoot extends StatefulWidget {
  final MainViewModel viewModel;

  const MainRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<MainRoot> createState() => _MainRootState();
}

class _MainRootState extends State<MainRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipeData();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return MainBody(
          state: widget.viewModel.state,
          onAction: (MainAction action) {
            widget.viewModel.onAction(action);
            if(action is ClickOnRecipe) {
              context.push('${Routes.recipeDetail}/${action.recipeId}');
            }
          },
        );
      },
    );
  }
}
