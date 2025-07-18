import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function(bool oldValue) onTap;

  const RatingButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(isSelected),
      child: Container(
        width: 50,
        height: 28,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary100 : AppColors.primary80,
          ),
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? AppColors.white : AppColors.primary80,
              ),
            ),
            Icon(
              Icons.star,
              size: 18,
              color: isSelected ? AppColors.white : AppColors.primary80,
            ),
          ],
        ),
      ),
    );
  }
}
