import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/core/enum/tap_state_type.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String title;
  final bool isTapDown;
  final Function(TapStateType) onTapStateChange;

  const SmallButton({
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
        width: 174.0,
        height: 37.0,
        decoration: BoxDecoration(
          color: isTapDown? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.smallButtonTitle,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
