import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';

class UnclickedRatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const UnclickedRatingButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 28,
      padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.primary80,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 8,
            child: Text(
              text,
              style: TextStyles.smallTextRegular.copyWith(
                color: AppColors.primary80,
                height: 1.214,
              ),
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.star, color: AppColors.primary80, size: 18),
        ],
      ),
    );
  }
}
