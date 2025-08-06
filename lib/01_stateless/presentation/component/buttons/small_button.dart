import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/text_styles.dart';

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: (widget.isEnabled && !isPressed) ? widget.color : AppColors.gray4,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.smallerTextSemibold,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final String text;
  final void Function() onClick;
  final bool isEnabled;

  const SmallButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.onClick,
    required this.isEnabled,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}
