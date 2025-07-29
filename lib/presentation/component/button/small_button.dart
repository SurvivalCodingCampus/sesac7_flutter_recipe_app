import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final void Function(String) onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = 174.0;
    final double buttonHeight = 37.0;
    final double textWidth = 114.0;
    final double textHeight = 17.0;

    return GestureDetector(
      onTap: () {
        widget.onClick('${widget.text}, Small button');
      },
      onTapDown: (details) {
        print(details.globalPosition);
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: _isPressed ? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Center(
          child: Container(
            width: textWidth,
            height: textHeight,
            decoration: BoxDecoration(
              color: _isPressed ? AppColors.gray4 : AppColors.primary100,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                key: const Key('small button'),
                widget.text,
                style: TextStyles.smallerTextBold.copyWith(
                  color: _isPressed ? AppColors.primary100 : AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
