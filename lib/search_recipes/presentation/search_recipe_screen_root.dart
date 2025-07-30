import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/search_recipes/presentation/search_recipe_event.dart';
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

  StreamSubscription? _eventSubscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRecipes();
    _eventSubscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowEmptyResultSnackBar():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(event.message),
                duration: const Duration(seconds: 3),
              ),
            );
            break;
          case ShowNetworkErrorSnackBar():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(event.message),
                duration: const Duration(seconds: 3),
              ),
            );
        }
      }
    });
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
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
                      // print('[DEBUG] 필터 적용: $appliedFilter');
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
