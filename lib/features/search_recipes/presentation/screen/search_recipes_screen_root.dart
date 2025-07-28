import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_action.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart';

import 'filter_search_bottom_sheet.dart';

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
            viewModel.onAction(action);

            if (action is ShowFilter) {
              showModalBottomSheet(
                isScrollControlled: true,
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 484,
                ),
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return FilterSearchBottomSheet(
                    filterSearchState: viewModel.state.filterSearchState,
                    onClosing: (state) {
                      viewModel.onAction(
                        SearchRecipesAction.applyFilter(state),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }
            // switch (action) {
            //   case ChangeQuery():
            //     viewModel.onAction(
            //       SearchRecipesAction.changeQuery(action.query),
            //     );
            //   case ShowFilter():
            //     viewModel.onAction(SearchRecipesAction.showFilter());
            //   case ApplyFilter():
            //     viewModel.onAction(
            //       SearchRecipesAction.applyFilter(action.state),
            //     );
            //     Navigator.pop(context);
            // }
          },
        );
      },
    );
  }
}
