import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  static const double width = 243;
  static const double height = 54;
  static const double spacing = 9;
  static const double textWidth = 114;
  static const int textMaxLines = 1;

  final String text;
  final VoidCallback onClick;

  const MediumButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: textWidth,
              child: Center(
                child: Text(
                  text,
                  style: TextStyles.normalTextBold.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: textMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
