import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/error_dialog.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_action.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_event.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/search_recipes/presentation/search_recipes_view_model.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  StreamSubscription<SearchRecipesEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init();

    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowErrorDialog():
            showErrorDialog(context, event.message);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SearchRecipesScreen(
          state: viewModel.state,
          onAction: (action) {
            switch (action) {
              case TapFilterButton():
                _showFilterBottomSheet(viewModel);
              default:
                viewModel.onAction(action);
            }
          },
        );
      },
    );
  }

  void _showFilterBottomSheet(SearchRecipesViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      builder: (context) => FilterSearchBottomSheet(
        filterState: viewModel.state.filterState,
        onFilterChange: (filterState) {
          viewModel.onAction(
            SearchRecipesAction.selectFilter(filterState),
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
