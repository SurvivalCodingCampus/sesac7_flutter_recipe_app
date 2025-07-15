import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class BigButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const BigButton({super.key,required this.buttonText ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 85, vertical: 18),
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
            SizedBox(width: 11),
            Icon(Icons.arrow_forward, color: AppColor.White),
          ],
        ),
      ),
    );
  }
}
