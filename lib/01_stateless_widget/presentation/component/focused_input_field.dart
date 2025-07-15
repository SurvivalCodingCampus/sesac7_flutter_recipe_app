import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class FocusedInputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;

  // typeDef가 정의되어있어 ValueChanged<String> 타입도 가능함
  final void Function(String) onValueChange;

  const FocusedInputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 315,
      height: 81,
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 21,
            child: Text(label, style: TextStyles.smallTextRegular),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 55,
            child: TextFormField(
              onChanged: onValueChange,
              style: TextStyles.smallerTextRegular,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                hintText: placeHolder,
                hintStyle: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.gray4,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary80,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
