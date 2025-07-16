import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class BigButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onTap;

  const BigButton({super.key, required this.buttonText, required this.onTap});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  String _stateButtonText = '';
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _stateButtonText = widget.buttonText;
  }

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
      onTap: () => widget.onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 85, vertical: 18),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 114, minHeight: 24),
              child: Center(
                child: Text(
                  '${_stateButtonText}',
                  style: TextStyle(
                    color: AppColor.White,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 11),
            Icon(Icons.arrow_forward, color: AppColor.White),
          ],
        ),
      ),
    );
  }
}
