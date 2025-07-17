import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onClick(),
      child: Container(
        width: 174,
        height: 37,
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
    );
  }
}
