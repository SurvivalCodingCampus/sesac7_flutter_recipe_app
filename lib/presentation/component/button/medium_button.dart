import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  static const double width = 243;
  static const double height = 54;
  static const double spacing = 9;
  static const int textMaxLines = 1;
  static const Key gestureKey = Key('medium button gesture');

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
      key: MediumButton.gestureKey,
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
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Row(
          spacing: MediumButton.spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(
                color: AppColors.white,
              ),
              maxLines: MediumButton.textMaxLines,
              overflow: TextOverflow.ellipsis,
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
