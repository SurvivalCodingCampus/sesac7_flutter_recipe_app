import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_event.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../../../core/routing/routes.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  const SearchRecipesScreenRoot({super.key});

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();

    // 약간 딜레이
    Future.microtask(() {
      if (mounted) {
        final viewModel = context.read<SearchRecipesViewModel>();
        viewModel.fetchRecipes();

        _streamSubscription = viewModel.eventStream.listen((event) {
          if (mounted) {
            switch (event) {
              case OpenDialog():
                showModalBottomSheet<FilterSearchState>(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return FilterSearchBottomSheet(
                      filterSearchState: viewModel.state.filterSearchState,
                      onFilter: (state) {
                        viewModel.onAction(
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchRecipesViewModel>();

    return SearchRecipesScreen(
      state: viewModel.state,
      onAction: (SearchRecipesAction action) {
        viewModel.onAction(action);
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
