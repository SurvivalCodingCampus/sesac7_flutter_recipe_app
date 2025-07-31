import 'package:flutter/material.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';
import '../recipe_detail_state.dart';

class RecipeTabs extends StatelessWidget {
  final RecipeTab selectedTab;
  final Function(RecipeTab) onTabChanged;

  const RecipeTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          // Ingredient 탭
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(RecipeTab.ingredient),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: selectedTab == RecipeTab.ingredient
                      ? AppColors.primary100
                      : AppColors.gray3,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Ingredient',
                  style: TextStyles.smallTextBold.copyWith(
                    fontSize: 11,
                    color: selectedTab == RecipeTab.ingredient
                        ? AppColors.white
                        : AppColors.primary80,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Procedure 탭
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(RecipeTab.procedure),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: selectedTab == RecipeTab.procedure
                      ? AppColors.primary100
                      : AppColors.gray3,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Procedure',
                  style: TextStyles.smallTextBold.copyWith(
                    fontSize: 11,
                    color: selectedTab == RecipeTab.procedure
                        ? AppColors.white
                        : AppColors.primary80,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
