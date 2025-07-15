import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class MediumButton extends StatelessWidget {
  const MediumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.Primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 114,
              minHeight: 24,
            ),
            child: Center(
              child: Text(
                'Button',
                style: TextStyle(
                  color: AppColor.White,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 9),
          Icon(Icons.arrow_forward, color: AppColor.White),
        ],
      ),
    );
  }
}
