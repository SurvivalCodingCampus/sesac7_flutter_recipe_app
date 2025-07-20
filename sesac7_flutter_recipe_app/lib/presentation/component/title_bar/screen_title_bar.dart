import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ScreenTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback backButtonClick;

  const ScreenTitleBar({
    super.key,
    required this.title,
    required this.backButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: backButtonClick,
          child: Icon(
            Icons.arrow_back,
            color: AppColors.black,
            size: 20.0,
          ),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyles.searchScreenTitle,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
