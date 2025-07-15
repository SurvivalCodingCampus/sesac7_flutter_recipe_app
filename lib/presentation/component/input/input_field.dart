import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final void Function(String) onValueChange;

  const InputField({
    super.key,
    required this.label,
    required this.placeholder,
    this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      height: 81,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 21,
            child: Text(
              label,
              style: TextStyles.smallerTextRegular,
            ),
          ),
          SizedBox(
            height: 55,
            child: TextFormField(
              initialValue: value,
              cursorHeight: 17,
              cursorColor: AppColors.black,
              cursorWidth: 1,
              onChanged: onValueChange,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 20,
                  top: 19,
                  bottom: 19,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray4,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary80,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: placeholder,
                hintStyle: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.gray4,
                ),
              ),
              style: TextStyles.smallerTextRegular,
            ),
          ),
        ],
      ),
    );
  }
}
