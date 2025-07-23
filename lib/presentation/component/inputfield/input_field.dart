import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final void Function(String) onValueChange;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    final double inputFieldWidth = 315.0;
    final double inputFieldHeight = 55.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.smallerTextRegular.copyWith(
            color: AppColors.black,
          ),
        ),
        Container(
          width: inputFieldWidth,
          height: inputFieldHeight,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: AppColors.gray4,
              width: 1.0,
            ),
          ),
          child: TextField(
            onChanged: onValueChange,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 11,
            ),
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(
                color: AppColors.gray4,
                fontSize: 11,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 17.0, // vertical 값을 (55px - 텍스트 높이) / 2
                horizontal: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
