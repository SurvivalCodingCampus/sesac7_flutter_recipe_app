import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';

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
          onSearch: (String query) {
            widget.viewModel.search(query);
          },
          onFilter: (FilterSearchState state) {
            widget.viewModel.filter(state);
          },
        );
      },
    );
  }
}
