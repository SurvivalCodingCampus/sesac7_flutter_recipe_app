import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/search_recipe_screen.dart';

import '../view_model/search_recipe_view_model.dart';
import 'action/search_recipes_action.dart' as SearchRecipesAction;
import 'action/search_recipes_action.dart';

class SearchRecipeScreenRoot extends StatelessWidget {
  const SearchRecipeScreenRoot({
    super.key,
    required this.searchRecipeViewModel, required this.onCallFilterBottomSheet,
  });

  final SearchRecipeViewModel searchRecipeViewModel;
  final void Function() onCallFilterBottomSheet;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: searchRecipeViewModel,
      builder: (BuildContext context, Widget? child) {
        return SearchRecipeScreen(
          onAction: (action) async {
            switch (action) {
              case close():
                Navigator.pop(context);
                break;
              case textValueChange():
                searchRecipeViewModel.onAction(SearchRecipesAction.textValueChange(action.value));
                break;
              case callFilterBottomSheet():
                // final result = await _showFilterBottomSheet(
                //   context,
                //   FilterSearchBottomSheetViewModel(),
                // );

                onCallFilterBottomSheet();
                break;
              case savedFilterStatue():
                break;
              case fetchRecipes():
                break;
            }
          },
          state: searchRecipeViewModel.searchRecipesState,
        );
      },
    );
  }
}
