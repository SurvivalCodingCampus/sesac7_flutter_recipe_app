import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/feature/home/domain/model/home_recipe_category.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCategorySelector extends StatefulWidget {
  final List<HomeRecipeCategory> categories;
  final void Function(HomeRecipeCategory category) onSelectCategory;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.onSelectCategory,
  });

  @override
  State<RecipeCategorySelector> createState() => _RecipeCategorySelectorState();
}

class _RecipeCategorySelectorState extends State<RecipeCategorySelector> {
  // TODO: HomeState로 이동 후 stl로 수정
  late HomeRecipeCategory selectedCategory;

  @override
  void initState() {
    super.initState();

    selectedCategory = widget.categories.first;
  }

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
            ...widget.categories.map((category) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                  widget.onSelectCategory(category);
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
