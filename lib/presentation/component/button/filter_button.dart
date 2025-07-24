import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 50.0,
        height: 28.0,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: AppColors.primary100,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? AppColors.white : AppColors.primary100,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
