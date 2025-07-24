import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/recipe_ingredients/presentation/recipe_ingredients_view_model.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';
import '../../../core/presentation/component/recipe_card.dart';

class RecipeIngredientsScreen extends StatelessWidget {
  final int recipeId;
  final RecipeIngredientsViewModel viewModel;

  const RecipeIngredientsScreen({
    super.key,
    required this.viewModel,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;
    // final recipe = viewModel.state.recipe;
    final ingredients = state.ingredients;

    if (state.recipe == null) {
      print('Recipe가 null');
    }

    assert(recipeId != null && recipeId > 0, 'recipeId 에러!');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🥪 레시피 대표 이미지 + 정보 (실제 컴포넌트로 교체!)
              RecipeCard(
                recipe: state.recipe!,
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

              // 재료 리스트 (컴포넌트 자리)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, idx) {
                  final ingredient = ingredients[idx];
                  // 여기에 IngredientCard 같은 컴포넌트 연결!
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.gray1,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      children: [
                        // 원형 이미지
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            ingredient.image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Text(
                            ingredient.name,
                            style: AppTextStyles.smallBold.copyWith(color: AppColors.black),
                          ),
                        ),
                        Text(
                          ingredient.amount,
                          style: AppTextStyles.smallRegular.copyWith(color: AppColors.gray3),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

  }
}
