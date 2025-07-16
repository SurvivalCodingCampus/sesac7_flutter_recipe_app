import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final String text;
  final void Function(String)? onClick;

  const BigButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call(text);
      },
      child: Container(
        width: 315,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                key: const Key('big button'),
                text,
                style: TextStyles.normalTextBold.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 30), // 간격
              Icon(
                Icons.arrow_forward_outlined,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
