import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final String title;
  final VoidCallback onClick;

  const MediumButton({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
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
        height: 54.0,
        decoration: BoxDecoration(
          color: _isTapDown ? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyles.mediumButtonTitle,
                maxLines: 1,
              ),
              SizedBox(
                width: 9.0,
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.white,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
