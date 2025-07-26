import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_home_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../di/di_setup.dart';
import '../../ui/text_styles.dart';
import '../component/card/dish_card.dart';
import '../component/control/recipe_category_selector.dart';
import '../component/input_field/search_inpu_field.dart';
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
