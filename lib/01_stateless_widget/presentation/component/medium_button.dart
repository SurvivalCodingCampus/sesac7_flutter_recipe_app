import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';

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
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 243,
        height: 54,
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              height: 24,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyles.normalTextBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
