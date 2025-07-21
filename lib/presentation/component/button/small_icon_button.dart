import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class SmallIconButton extends StatefulWidget {
  final IconData? icon;
  final VoidCallback? onTap;

  const SmallIconButton({super.key, this.icon = Icons.add, required this.onTap});

  @override
  State<SmallIconButton> createState() => _SmallIconButtonState();
}

class _SmallIconButtonState extends State<SmallIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = _isPressed ? AppColor.Gray4 : AppColor.Primary100;
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(widget.icon, color: AppColor.White, size: 20),
      ),
    );
  }
}
