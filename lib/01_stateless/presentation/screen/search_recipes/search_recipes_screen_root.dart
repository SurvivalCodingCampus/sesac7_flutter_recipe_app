import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';

import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';

class SearchRecipesScreenRoot extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel,
      builder: (context, state, child) {
        return SearchRecipesScreen(
          state: viewModel.state,
          onSearch: (String query) {
            viewModel.search(query);
          },
          onFilter: (FilterSearchState state) {
            viewModel.filter(state);
          },
        );
      },
    );
  }
}
