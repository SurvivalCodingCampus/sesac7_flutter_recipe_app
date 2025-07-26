import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../ui/text_styles.dart';
import '../state_holder/recipe_view_state.dart';
import 'action/saved_recipes_action.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({
    super.key,
    required this.recipeViewState,
    required this.onAction,
  });

  //final RecipeViewModel recipeViewModel;
  final RecipeViewState recipeViewState;

  final void Function(SavedRecipesAction action) onAction;

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
      body: recipeViewState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: AppColors.white,
              child: ListView.builder(
                itemCount: recipeViewState
                    .recipes
                    .length, // 이미지에 보이는 아이템 개수 (더미 데이터)
                itemBuilder: (context, index) {
                  final searchTerm =
                      recipeViewState.recipes[index];

                  // 각 리스트 아이템을 나타내는 카드 위젯
                  return GestureDetector(
                    onTap: () {
                      onAction(SavedRecipesAction.onCallRecipeDetailScreen(searchTerm.id.toString()));
                      // router.push<Recipe>(
                      //   '${Routes.recipesDetail}/${searchTerm.id}',
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 10,
                      ),
                      child: RecipeCard(
                        recipe:
                            recipeViewState.recipes[index],
                        saveRecipeCallback: (recipeId) {
                          onAction(SavedRecipesAction.onSavedRecipe(recipeId));
                          //recipeViewModel.saveRecipe(recipeId);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
