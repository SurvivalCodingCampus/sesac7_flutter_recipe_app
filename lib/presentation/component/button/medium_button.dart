import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class MediumButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  final IconData? icon;

  const MediumButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.Primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 114, minHeight: 24),
              child: Center(
                child: Text(
                  '$buttonText',
                  style: TextStyle(
                    color: AppColor.White,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            icon != null
                ? Row(
                    children: [
                      SizedBox(width: 9),
                      Icon(icon, color: AppColor.White),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
