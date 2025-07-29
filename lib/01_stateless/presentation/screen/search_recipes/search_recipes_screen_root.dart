import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_event.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import '../../../core/presentation/component/bottom_sheet/filter_search_state.dart';
import '../../../core/routing/routes.dart';

class SearchRecipesScreenRoot extends ConsumerStatefulWidget {
  const SearchRecipesScreenRoot({super.key});

  @override
  ConsumerState<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootConsumerState();
}

class _SearchRecipesScreenRootConsumerState
    extends ConsumerState<SearchRecipesScreenRoot> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    final viewModel = ref.read(searchRecipesNotifierProvider.notifier);
    viewModel.fetchRecipes();

    _streamSubscription = viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case OpenDialog():
            // 이벤트 발생 시점에 현재 상태를 동적으로 가져옴
            final currentState = ref.read(searchRecipesNotifierProvider);
            showModalBottomSheet<FilterSearchState>(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return FilterSearchBottomSheet(
                  filterSearchState: currentState.filterSearchState,
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchRecipesNotifierProvider);

    return SearchRecipesScreen(
      state: state,
      onAction: (SearchRecipesAction action) {
        ref.read(searchRecipesNotifierProvider.notifier).onAction(action);
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
