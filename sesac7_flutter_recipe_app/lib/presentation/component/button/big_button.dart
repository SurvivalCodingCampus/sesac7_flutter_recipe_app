import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/tap_state_type.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  final String title;
  final bool isTapDown;
  final Function(TapStateType) onTapStateChange;

  const BigButton({
    super.key,
    required this.title,
    required this.isTapDown,
    required this.onTapStateChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        onTapStateChange(TapStateType.onTapDown);
      },
      onTapUp: (_) {
        onTapStateChange(TapStateType.onTapUp);
      },
      onTapCancel: () {
        onTapStateChange(TapStateType.onTapCancel);
      },
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: isTapDown ? AppColors.gray4 : AppColors.primary100,
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
                    maxLines: 1,
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
      ),
    );
  }
}
