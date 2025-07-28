import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_action.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_event.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen.dart';
import 'package:flutter_recipe_app/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart';

import 'filter_search_bottom_sheet.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesScreenViewModel viewModel;

  const SearchRecipesScreenRoot({
    super.key,
    required SearchRecipesScreenViewModel searchRecipesScreenViewModel,
  }) : viewModel = searchRecipesScreenViewModel;

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  StreamSubscription<SearchRecipesEvent>? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = widget.viewModel.eventStream.stream.listen(
      (event) {
        if (!context.mounted) {
          return;
        }

        switch (event) {
          case HasNoResult():
            final snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text('검색 결과가 없습니다.'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowErrorMessage():
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('에러: ${event.error}'),
                );
              },
            );
          case ShowFilterBottomSheet():
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
                  filterSearchState: widget.viewModel.state.filterSearchState,
                  onClosing: (state) {
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
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (BuildContext context, Widget? child) {
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
