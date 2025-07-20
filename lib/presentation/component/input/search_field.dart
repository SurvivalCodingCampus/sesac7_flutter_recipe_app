import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchField extends StatelessWidget {
  static const double height = 40;
  static const double borderWidth = 1.3;
  static const EdgeInsets inputPadding = EdgeInsets.only(left: 38);
  static const double iconPadding = 10;

  final String placeholder;
  final String? value;
  final void Function(String) onValueChange;

  const SearchField({
    super.key,
    required this.placeholder,
    this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          TextFormField(
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
          Positioned(
            left: iconPadding,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.search,
              color: AppColors.gray4,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
