import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/routing/routes.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/bottom_sheet/bottom_sheet_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/bottom_sheet/filter_search_bottom_sheet.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:go_router/go_router.dart';

class SearchRecipesRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SearchRecipesRoot> createState() => _SearchRecipesRootState();
}

class _SearchRecipesRootState extends State<SearchRecipesRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return SearchRecipesScreen(
            state: widget.viewModel.state,
            onAction: (SearchRecipesAction action) {
              widget.viewModel.onAction(action);
              if (action is ClickOnBackspace) {
                context.pop();
              }
              else if (action is ClickOnRecipe) {
                context.push('${Routes.recipeDetail}/${action.recipeId}');
              }
              else if (action is BringBottomSheet) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  builder: (context) {
                    return ListenableBuilder(
                      listenable: widget.viewModel,
                      builder: (context, child) {
                        return FilterSearchBottomSheet(
                            onAction: (BottomSheetAction action) {
                              widget.viewModel.onBottomSheetAction(action);
                              if (action is ClickOnFilter) {
                                context.pop();
                              }
                            },
                            state: widget.viewModel.state
                        );
                      },
                    );
                  }
                );
              }
            },
          );
        },
    );
  }
}
