import 'package:flutter/material.dart';

import '../../../../core/category.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class RecipeCategorySelector extends StatelessWidget {
  final String category;
  final void Function(String category) onSelectCategory;

  const RecipeCategorySelector({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(Category.values.length, (index) {
              return GestureDetector(
                onTap: () {
                  onSelectCategory(Category.values[index].name);
                },
                child: AnimatedContainer(
                  // width: 54,
                  height: 31,
                  padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
                  margin: EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                    color: category == Category.values[index].name
                        ? AppColors.primary100
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  duration: Duration(milliseconds: 150),
                  child: Text(
                    Category.values[index].name,
                    style: TextStyles.smallerTextBold.copyWith(
                      color: category == Category.values[index].name
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
