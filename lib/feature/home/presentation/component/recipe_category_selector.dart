import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCategorySelector extends StatelessWidget {
  final List<HomeRecipeCategory> categories;
  final HomeRecipeCategory selectedCategory;
  final void Function(HomeRecipeCategory category) onSelectCategory;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Row(
          children: [
            ...categories.map((category) {
              return GestureDetector(
                onTap: () {
                  onSelectCategory(category);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: selectedCategory == category
                        ? AppColors.primary100
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(
                      ComponentConstant.borderRadius,
                    ),
                  ),
                  child: Text(
                    category.toString(),
                    style: TextStyles.smallerTextBold.copyWith(
                      color: selectedCategory == category
                          ? AppColors.white
                          : AppColors.primary80,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
