import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  static const double width = 174;
  static const double height = 37;
  static const double textWidth = 114;
  static const int textMaxLines = 1;

  final String text;
  final VoidCallback onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: textWidth,
          child: Center(
            child: Text(
              text,
              style: TextStyles.smallerTextBold.copyWith(
                color: AppColors.white,
              ),
              maxLines: textMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
