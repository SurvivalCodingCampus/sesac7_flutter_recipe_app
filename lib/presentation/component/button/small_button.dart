import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final void Function(String) onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = 174.0;
    final double buttonHeight = 37.0;
    final double textWidth = 114.0;
    final double textHeight = 17.0;

    return GestureDetector(
      onTap: () {
        onClick('$text, Small button');
      },
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Center(
          child: Container(
            width: textWidth,
            height: textHeight,
            decoration: BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                key: const Key('small button'),
                text,
                style: TextStyles.smallerTextBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
