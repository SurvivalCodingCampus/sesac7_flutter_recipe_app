import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const MediumButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 114,
            height: 24,
            child: Text(
              text,
              style: TextStyles.normalTextBold.copyWith(color: AppColors.white),

            ),
          ),
          SizedBox(width: 9),
          Icon(Icons.arrow_forward_outlined, color: AppColors.white,size: 20,),
        ],
      ),
    );
  }
}
