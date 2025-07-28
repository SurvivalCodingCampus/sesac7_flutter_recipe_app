import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/bottom_sheet/search_recipe_filter_bottom_sheet.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_action.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_event.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel  _searchRecipesViewModel;

  const SearchRecipesScreenRoot(
    SearchRecipesViewModel searchRecipesViewModel, {
    super.key,
  }) : _searchRecipesViewModel = searchRecipesViewModel;

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  StreamSubscription<SearchRecipesEvent>? _subscription;
  @override
  void initState() {
    super.initState();
    widget._searchRecipesViewModel.fetchRecentRecipes();
    _subscription ??= widget._searchRecipesViewModel.eventStream.listen((event) {
      switch (event) {
        case ShowEmptyResultError():
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('검색 결과가 없습니다.'),
              ),
            );
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
    return ValueListenableBuilder(
      valueListenable: widget._searchRecipesViewModel,
      builder: (context, value, child) {
        return SearchRecipesScreen(
          searchRecipesState: value,
          onAction: (action) {
            switch (action) {
              case ChangeKeyword():
                widget._searchRecipesViewModel.onAction(action);
              case ShowFilterBottomSheet():
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: AppColors.white,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  builder: (context) {
                    return SearchRecipeFilterBottomSheet(
                      onValueChange: (timeType, ratingType, categoryType) {
                        // 여기 이상한듯 ViewModel로 가는거까지는 ok 그런데 아래 case SearchFilteredRecipe가 있으니까 이상함.
                        widget._searchRecipesViewModel.onAction(
                          SearchRecipesAction.searchFilteredRecipe(
                            timeType,
                            ratingType,
                            categoryType,
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              case SearchFilteredRecipe():
                break;
            }
          },
        );
      },
    );
  }
}
