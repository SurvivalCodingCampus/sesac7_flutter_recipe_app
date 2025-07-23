import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const BigButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 60,
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
            SizedBox(width: 11),
            Icon(Icons.arrow_forward_outlined, color: AppColors.white,size: 20,),
          ],
        ),
      ),
    );
  }
}
