import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
              minHeight: 17,
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
        ],
      ),
    );
  }
}
