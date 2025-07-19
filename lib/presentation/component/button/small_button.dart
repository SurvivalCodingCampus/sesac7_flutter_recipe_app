import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  static const double width = 174;
  static const double height = 37;
  static const int textMaxLines = 1;

  final String text;
  final VoidCallback onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
        width: SmallButton.width,
        height: SmallButton.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyles.smallerTextBold.copyWith(
              color: AppColors.white,
            ),
            maxLines: SmallButton.textMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
