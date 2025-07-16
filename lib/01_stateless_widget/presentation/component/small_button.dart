import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';

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
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 174,
        height: 37,
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: 114,
          height: 17,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.smallTextBold.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
