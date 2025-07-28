import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipe_screen.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipes_view_model.dart';

import '../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';

class SearchRecipeScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipeScreenRoot({super.key, required this.viewModel});

  @override
  State<SearchRecipeScreenRoot> createState() => _SearchRecipeScreenRootState();
}

class _SearchRecipeScreenRootState extends State<SearchRecipeScreenRoot> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SearchRecipeScreen(
          state: widget.viewModel.state,
          onAction: (SearchRecipesAction action) {
            widget.viewModel.onAction(action);
            
            if (action is ShowFilterBottomSheet) {
              showModalBottomSheet<FilterSearchBottomSheet>(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return FilterSearchBottomSheet(
                    initialFilter: widget.viewModel.state.filterSearchState,
                    onFilterApplied: (appliedFilter) {
                      print('[DEBUG] 필터 적용: $appliedFilter');
                      widget.viewModel.onAction(SearchRecipesAction.applyFilter(appliedFilter));
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }
          }
          // onChanged: () {},
          // showFilterBottomSheet: () {
        );
      }
    );
  }
}
