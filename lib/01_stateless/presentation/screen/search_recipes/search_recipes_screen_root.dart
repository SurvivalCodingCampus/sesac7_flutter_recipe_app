import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';

import '../../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot(this.viewModel, {super.key});

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.viewModel,
      builder: (context, state, child) {
        return SearchRecipesScreen(
          state: widget.viewModel.state,
          onAction: (SearchRecipesAction action) {
            widget.viewModel.onAction(action);

            if (action is OpenDialog) {
              showModalBottomSheet<FilterSearchState>(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return FilterSearchBottomSheet(
                    filterSearchState: state.filterSearchState,
                    onFilter: (state) {
                      widget.viewModel.onAction(
                        SearchRecipesAction.applyFilter(state),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
