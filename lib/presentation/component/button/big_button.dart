import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  static const double width = 315;
  static const double height = 60;
  static const double spacing = 11;
  static const double textWidth = 114;
  static const int textMaxLines = 1;

  final String text;
  final VoidCallback onClick;

  const BigButton({
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
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
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
              size: ComponentConstant.iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
