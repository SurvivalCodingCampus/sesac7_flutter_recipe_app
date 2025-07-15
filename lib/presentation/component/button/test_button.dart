import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class TestButton extends StatelessWidget {
  final String text;
  final void Function(String)? onClick;

  const TestButton({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 114,
            height: 24,
            child: Text(
              key: const Key('test button'),
              text,
              style: TextStyles.mediumTextBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            child: Icon(
              Icons.arrow_forward_outlined,
              color: AppColors.black,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
