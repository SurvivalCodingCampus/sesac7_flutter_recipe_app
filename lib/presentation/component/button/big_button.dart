import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatefulWidget {
  static const double height = 60;
  static const double spacing = 11;
  static const int textMaxLines = 1;
  static const Key gestureKey = Key('big button gesture');
  static const Key buttonContainerKey = Key('big button container');

  final String text;
  final VoidCallback onClick;

  const BigButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: BigButton.gestureKey,
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
        key: BigButton.buttonContainerKey,
        height: BigButton.height,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Row(
          spacing: BigButton.spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyles.normalTextBold.copyWith(
                color: AppColors.white,
              ),
              maxLines: BigButton.textMaxLines,
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
