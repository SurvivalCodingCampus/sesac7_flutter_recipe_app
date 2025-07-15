import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final String title;
  final VoidCallback? onClick;

  const MediumButton({
    super.key,
    required this.title,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        width: 243.0,
        height: 54.0,
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
                    style: TextStyles.mediumButtonTitle,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                width: 9.0,
              ),
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: Center(child: Icon(Icons.arrow_forward)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
