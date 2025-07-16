import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 174,
      height: 37,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 114,
        height: 17,
        child: Center(
          child: Text(
            text,
            style: TextStyles.smallerTextBold.copyWith(color: AppColors.white),

          ),
        ),
      ),
    );
  }
}
