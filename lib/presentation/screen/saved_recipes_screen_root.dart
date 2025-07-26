import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/action/saved_recipes_action.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../core/routing/router.dart';
import '../../core/routing/routes.dart';
import '../../domain/model/recipe.dart';
import '../../ui/text_styles.dart';

class SavedRecipesScreenRoot extends StatelessWidget {
  const SavedRecipesScreenRoot({super.key, required this.recipeViewModel});

  final RecipeViewModel recipeViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: TextStyles.mediumTextBold.copyWith(color: AppColors.colour),
        ),
        centerTitle: true, // 타이틀 중앙 정렬
        backgroundColor: Colors.white, // 배경색 흰색
        elevation: 0, // AppBar 아래 그림자 제거
      ),
      body: ListenableBuilder(
        listenable: recipeViewModel,
        builder: (BuildContext context, Widget? child) {
          return SavedRecipesScreen(
            recipeViewState: recipeViewModel.recipeViewState,
            onAction: (savedRecipesAction){
              switch (savedRecipesAction) {
                case callRecipeDetailScreen():
                  router.push<Recipe>(
                    '${Routes.recipesDetail}/${savedRecipesAction.recipeId}',
                  );
                  break;
                case savedRecipe():
                  //recipeViewModel.saveRecipe(savedRecipesAction.recipeId);
                  recipeViewModel.onAction(SavedRecipesAction.onSavedRecipe(savedRecipesAction.recipeId));
              }
            },
          );
        },
      ),
    );
  }
}
