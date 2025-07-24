import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/card/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/view_model/recipe_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../core/routing/router.dart';
import '../../core/routing/routes.dart';
import '../../domain/model/recipe.dart';
import '../../ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key, required this.recipeViewModel});

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
          return recipeViewModel.recipeViewState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  color: AppColors.white,
                  child: ListView.builder(
                    itemCount: recipeViewModel
                        .recipeViewState
                        .recipes
                        .length, // 이미지에 보이는 아이템 개수 (더미 데이터)
                    itemBuilder: (context, index) {
                      final searchTerm =
                          recipeViewModel.recipeViewState.recipes[index];

                      // 각 리스트 아이템을 나타내는 카드 위젯
                      return GestureDetector(
                        onTap: () {
                          router.push<Recipe>(
                            Routes.recipesDetail,
                            extra: searchTerm,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            bottom: 10,
                          ),
                          child: RecipeCard(
                            recipe:
                                recipeViewModel.recipeViewState.recipes[index],
                            saveRecipeCallback: (recipeId) {
                              recipeViewModel.saveRecipe(recipeId);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
