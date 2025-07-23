import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final void Function(String) onClick;

  const MediumButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = 243.0;
    final double buttonHeight = 54.0;
    final double iconSize = 20.0;

    return GestureDetector(
      onTap: () {
        onClick('$text, Medium button');
      },
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.mediumTextBold.copyWith(
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 9),
            Icon(
              Icons.arrow_forward,
              size: iconSize,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
