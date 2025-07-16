import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingDialogButton extends StatelessWidget {
  final String buttonTitle;
  final bool buttonActive;
  final VoidCallback onTap;

  const RatingDialogButton({
    super.key,
    required this.buttonTitle,
    required this.buttonActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        decoration: BoxDecoration(
          color: buttonActive ? AppColors.rating : AppColors.gray4,
          borderRadius: BorderRadius.circular(6.0)
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
        child: Text(
          buttonTitle,
          style: TextStyles.ratingDialogButtonTitle,
        ),
      ),
    );
  }
}
