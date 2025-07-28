import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_event.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../../../core/routing/routes.dart';

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

    widget.viewModel.eventStream.listen((event) {
      if (context.mounted) {
        switch (event) {
          case OpenDialog():
            showModalBottomSheet<FilterSearchState>(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return FilterSearchBottomSheet(
                  filterSearchState: widget.viewModel.state.filterSearchState,
                  onFilter: (state) {
                    widget.viewModel.onAction(
                      SearchRecipesAction.applyFilter(state),
                    );
                    Navigator.pop(context);
                  },
                );
              },
            );
          case NaviagteHome():
            context.go(Routes.main);
          case NavigatePreviousScreen():
            context.go(Routes.ingredient);
          case ShowErrorMessage():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(event.message),
              ),
            );
        }
      }
    });
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
          },
        );
      },
    );
  }
}
