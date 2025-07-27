import 'package:flutter/material.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class SearchInputField extends StatelessWidget {
  final String placeHolder;

  // typeDef가 정의되어있어 ValueChanged<String> 타입도 가능함
  final void Function(String) onValueChange;

  const SearchInputField({
    super.key,
    required this.placeHolder,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: onValueChange,
            style: TextStyles.smallerTextRegular,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.gray4,
                size: 18,
              ),
              contentPadding: EdgeInsets.only(bottom: 5),
              filled: true,
              fillColor: AppColors.white,
              hintText: placeHolder,
              hintStyle: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray4,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.gray4,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
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
    );
  }
}
