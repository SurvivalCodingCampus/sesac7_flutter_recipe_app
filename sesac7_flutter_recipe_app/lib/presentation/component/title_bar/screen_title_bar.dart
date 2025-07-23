import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ScreenTitleBar extends StatelessWidget {
  final String? title;
  final VoidCallback? backButtonClick;
  final VoidCallback? menuButtonClick;

  const ScreenTitleBar({
    super.key,
    this.title,
    this.backButtonClick,
    this.menuButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backButtonClick == null
            ? SizedBox(
                width: 20.0,
              )
            : GestureDetector(
                onTap: backButtonClick,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  size: 20.0,
                ),
              ),
        Text(
          title ?? '',
          style: TextStyles.searchScreenTitle,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        menuButtonClick == null
            ? SizedBox(
                width: 20.0,
              )
            : GestureDetector(
                onTap: menuButtonClick,
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.black,
                  size: 24.0,
                ),
              ),
      ],
    );
  }
}
