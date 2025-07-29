import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_action.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_view_model.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';
import '../../../core/presentation/component/recipe_card.dart';
import '../../core/presentation/component/ingredient/ingredient_item.dart';
import '../domain/model/recipe_menu_item.dart';

class RecipeIngredientsScreen extends StatelessWidget {
  // final int recipeId;
  final RecipeIngredientsViewModel viewModel;
  final void Function(RecipeIngredientsAction action) onAction;

  const RecipeIngredientsScreen({
    super.key,
    required this.viewModel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final state = viewModel.state;

        // recipe가 아직 null일 때
        if (state.recipe == null) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final recipe = state.recipe!;
        final ingredients = state.ingredients;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
                      ),
                      const Spacer(),
                      PopupMenuButton<RecipeMenuItem>(
                        icon: const Icon(Icons.more_horiz, color: AppColors.black),
                        onSelected: (selectedItem) {
                          onAction(RecipeIngredientsAction.menuItemSelected(selectedItem));
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: RecipeMenuItem.rate, child: Text('Rate')),
                          PopupMenuItem(value: RecipeMenuItem.review, child: Text('Review')),
                          PopupMenuItem(value: RecipeMenuItem.unsave, child: Text('Unsave')),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // 🥪 레시피 대표 이미지 + 정보 (실제 컴포넌트로 교체!)
                  RecipeCard(
                    recipe: recipe,
                    isBookmarked: false,
                    isShowTime: true,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    state.recipe?.name ?? 'none',
                    style: AppTextStyles.mediumBold.copyWith(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text('none', style: AppTextStyles.smallerRegular.copyWith(color: AppColors.gray4)),
                  const SizedBox(height: 16),

                  // 작성자 & 팔로우 버튼
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.recipe?.chef ?? 'none', style: AppTextStyles.smallBold),
                          Text('Lagos, Nigeria', style: AppTextStyles.smallerRegular.copyWith(color: AppColors.gray3)),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary100,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Follow'),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 탭 (재료/과정)
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Ingredient',
                            style: AppTextStyles.smallBold.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Procedure',
                            style: AppTextStyles.smallRegular.copyWith(color: AppColors.gray4),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 서빙/아이템 수
                  Row(
                    children: [
                      const Icon(Icons.local_dining, size: 16, color: AppColors.gray3),
                      const SizedBox(width: 6),
                      Text('1 serve', style: AppTextStyles.smallerRegular),
                      const Spacer(),
                      Text('${ingredients.length} items', style: AppTextStyles.smallerRegular),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // 재료 리스트
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ingredients.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, idx) {
                      final ingredient = ingredients[idx];
                      return IngredientItem(ingredient: ingredient);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );

  }
}
