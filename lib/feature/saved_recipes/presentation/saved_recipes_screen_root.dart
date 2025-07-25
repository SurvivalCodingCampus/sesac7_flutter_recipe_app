import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/query_parameters.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_action.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:go_router/go_router.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
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
                context.push(
                  Uri(
                    path: Routes.ingredient,
                    queryParameters: {QueryParameters.id: action.recipeId},
                  ).toString(),
                );
              default:
                viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
