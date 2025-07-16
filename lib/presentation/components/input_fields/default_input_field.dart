import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class DefaultInputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final void Function(String value) onValueChange;

  const DefaultInputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.smallTextRegular,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: onValueChange,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(color: AppColors.gray4),
              enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(color: AppColors.gray4),
                borderRadius: BorderRadius.circular(10),
              ),
              // border: OutlineInputBorder(
              //   borderSide:BorderSide(color: AppColors.gray4),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(
              //     color: AppColors.primary80,
              //   ),
              // ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            label,
            style: TextStyles.smallTextRegular,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: onValueChange,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(color: AppColors.gray4),
              // enabledBorder: OutlineInputBorder(
              //   borderSide:BorderSide(color: AppColors.gray4),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              // border: OutlineInputBorder(
              //   borderSide:BorderSide(color: AppColors.gray4),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primary80,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            label,
            style: TextStyles.smallTextRegular,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: onValueChange,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(color: AppColors.gray4),
              enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(color: AppColors.gray4),
                borderRadius: BorderRadius.circular(10),
              ),
              // border: OutlineInputBorder(
              //   borderSide:BorderSide(color: AppColors.gray4),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primary80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
