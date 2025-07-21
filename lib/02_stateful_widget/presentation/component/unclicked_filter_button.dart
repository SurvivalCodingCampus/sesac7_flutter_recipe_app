import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';

class UnclickedFilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onClick;

  const UnclickedFilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        // width: 51,
        height: 28,
        padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
        decoration: BoxDecoration(
          color: (isSelected == true) ? AppColors.primary80 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primary80,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyles.smallTextRegular.copyWith(
                color: (isSelected == true)
                    ? AppColors.white
                    : AppColors.primary80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
