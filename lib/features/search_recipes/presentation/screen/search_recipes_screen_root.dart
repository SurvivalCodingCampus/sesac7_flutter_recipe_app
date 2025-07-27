import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_action.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart';

class SearchRecipesScreenRoot extends StatelessWidget {
  final SearchRecipesScreenViewModel viewModel;

  const SearchRecipesScreenRoot({
    super.key,
    required SearchRecipesScreenViewModel searchRecipesScreenViewModel,
  }) : viewModel = searchRecipesScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        return SearchRecipesScreen(
          state: viewModel.state,
          onAction: (SearchRecipesAction action) {
            switch (action) {
              case ChangeQuery():
                viewModel.onAction(
                  SearchRecipesAction.changeQuery(action.query),
                );
              case ShowFilter():
                viewModel.onAction(SearchRecipesAction.showFilter());
              case ApplyFilter():
                viewModel.onAction(
                  SearchRecipesAction.applyFilter(action.state),
                );
                Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}
