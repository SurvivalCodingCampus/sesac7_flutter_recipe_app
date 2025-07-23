import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class InputField extends StatelessWidget {
  static const double height = 81;
  static const double spacing = 5;
  static const double labelHeight = 21;
  static const double inputHeight = 55;
  static const double borderWidth = 1.5;
  static const EdgeInsetsGeometry inputPadding = EdgeInsets.only(
    left: 20,
    top: 19,
    bottom: 19,
  );

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
      height: height,
      child: Column(
        spacing: spacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: labelHeight,
            child: Text(
              label,
              style: TextStyles.smallerTextRegular,
            ),
          ),
          SizedBox(
            height: inputHeight,
            child: TextFormField(
              initialValue: value,
              cursorHeight: ComponentConstant.cursorHeight,
              cursorColor: AppColors.black,
              cursorWidth: ComponentConstant.cursorWidth,
              onChanged: onValueChange,
              decoration: InputDecoration(
                contentPadding: inputPadding,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray4,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                    ComponentConstant.borderRadius,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary80,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                    ComponentConstant.borderRadius,
                  ),
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
