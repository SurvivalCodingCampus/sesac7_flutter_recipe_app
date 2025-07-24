import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? AppColors.primary100 : AppColors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: isSelected
              ? TextStyles.selectedCategoryTitle
              : TextStyles.unSelectedCategoryTitle,
          maxLines: 1,
        ),
      ),
    );
  }
}
