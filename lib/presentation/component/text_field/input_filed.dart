import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class InputFiled extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final Function(String) onValueChange;

  const InputFiled({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 38.0,
            height: 21.0,
            child: Text(
              label,
              style: TextStyles.inputFiledLabel,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5.0),
          SizedBox(
            width: double.infinity,
            height: 55.0,
            child: TextField(
              onChanged: (value) {
                onValueChange(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20.0),
                hintText: placeHolder,
                hintStyle: TextStyles.inputFiledHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: AppColors.gray4,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: AppColors.primary80,
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
