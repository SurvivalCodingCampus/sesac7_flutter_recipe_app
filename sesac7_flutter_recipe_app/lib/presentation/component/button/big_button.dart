import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final String title;
  final VoidCallback onClick;

  const BigButton({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapDown = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapDown = false;
        });
      },
      onTap: widget.onClick,
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: _isTapDown ? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 114.0,
              child: Text(
                widget.title,
                style: TextStyles.bigButtonTitle,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 11.0,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColors.white,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
