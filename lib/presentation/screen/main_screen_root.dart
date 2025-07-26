import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_home_view_model.dart';

import 'action/main_screen_action.dart';
import 'main_screen.dart';

class MainScreenRoot extends StatelessWidget {
  const MainScreenRoot({
    super.key,
    required this.homeRecipeViewModel,
  });

  final RecipeHomeViewModel homeRecipeViewModel;

  @override
  Widget build(BuildContext context) {
    //final homeRecipeViewModel = getIt<RecipeHomeViewModel>();
    //final recipeState = homeRecipeViewModel.state;

    return ListenableBuilder(
      listenable: homeRecipeViewModel,
      builder: (BuildContext context, Widget? child) {
        return MainScreen(
          state: homeRecipeViewModel.state,
          onAction: (MainScreenAction action) {
            homeRecipeViewModel.onAction(action);
          },
        );
      },
    );
  }
}
