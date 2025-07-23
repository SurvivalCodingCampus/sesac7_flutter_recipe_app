import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/common/shimmer_list.dart';
import 'package:flutter_recipe_app/saved_recipes/presentation/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/core/presentation/component/recipe_card.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/routes.dart';
import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class RecipeCardScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const RecipeCardScreen({super.key, required this.viewModel});

  // ListenableBuilder : main 에서 하지 않고 screen 에서
  // ListenableBuilder 스크린 마다 하나씩 필요

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final state = viewModel.state;

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Saved Recipes',
                    style: AppTextStyles.largeBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: state.isLoading
                    ? const ShimmerList()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListView.separated(
                          itemCount: viewModel.bookmarkedRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = viewModel.bookmarkedRecipes[index];
                            return GestureDetector(
                              onTap: () {
                                context.push('${Routes.recipeIngredients}/${recipe.id}');
                              },
                              child: RecipeCard(
                                recipe: recipe,
                                isBookmarked: true,
                                onBookmarkTap: () =>
                                    viewModel.unsave(recipe.id),
                                isShowTime: true,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
