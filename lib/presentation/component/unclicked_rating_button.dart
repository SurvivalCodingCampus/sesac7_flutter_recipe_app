import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class UnclickedRatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onClick;

  const UnclickedRatingButton({
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
        width: 51,
        height: 28,
        padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
        decoration: BoxDecoration(
          color: (isSelected == true) ? AppColors.primary80 : AppColors.white,
          border: Border.all(
            color: AppColors.primary80,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 8,
              child: Text(
                text,
                style: TextStyles.smallTextRegular.copyWith(
                  color: (isSelected == true)
                      ? AppColors.white
                      : AppColors.primary80,
                  height: 1.214,
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.star,
              color: (isSelected == true)
                  ? AppColors.white
                  : AppColors.primary80,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
