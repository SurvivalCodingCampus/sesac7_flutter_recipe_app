import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String ratingButtonTitle;
  final bool isSelected;
  final Function(bool isSelected) onValueChange;

  const RatingButton({
    super.key,
    required this.ratingButtonTitle,
    required this.isSelected,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onValueChange(!isSelected);
      },
      child: Container(
        height: 28.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? AppColors.primary100 : AppColors.primary80,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ratingButtonTitle,
              style: isSelected
                  ? TextStyles.selectedRatingTitle
                  : TextStyles.unSelectedRatingTitle,
            ),
            SizedBox(width: 0.5),
            Icon(
              Icons.star,
              color: isSelected ? AppColors.white : AppColors.primary80,
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
