import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  static const double width = 243;
  static const double height = 54;
  static const double spacing = 9;
  static const double textWidth = 114;
  static const int textMaxLines = 1;

  final String text;
  final VoidCallback onClick;

  const MediumButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (details) {
        setState(() {
          isEnabled = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isEnabled = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isEnabled = true;
        });
      },
      child: Container(
        width: MediumButton.width,
        height: MediumButton.height,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Row(
          spacing: MediumButton.spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediumButton.textWidth,
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyles.normalTextBold.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: MediumButton.textMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColors.white,
              size: ComponentConstant.iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
