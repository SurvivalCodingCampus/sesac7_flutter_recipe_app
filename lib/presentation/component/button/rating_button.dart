import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const RatingButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 50.0,
        height: 28.0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary100 : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: AppColors.primary100,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: isSelected ? AppColors.white : AppColors.primary100,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.star,
                size: 18,
                color: isSelected ? AppColors.white : AppColors.primary100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
