import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final String title;
  final Function(void)? onClick;

  const BigButton({
    super.key,
    required this.title,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114.0,
              height: 24.0,
              child: Center(
                child: Text(
                  title,
                  style: TextStyles.bigButtonTitle,
                ),
              ),
            ),
            SizedBox(
              width: 11.0,
            ),
            SizedBox(
              width: 20.0,
              height: 20.0,
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
