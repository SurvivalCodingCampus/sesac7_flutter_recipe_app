import 'package:flutter/material.dart';
import '../../../ui/app_colors.dart';

class BigButton extends StatefulWidget {
  final String text;
  final void Function() onTap;
  final bool isDisabled;
  // final void Function() onClick;
  // VoidCallback = void Function()
  BigButton({
    required this.text,
    required this.onTap,
    required this.isDisabled,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {

  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            isDisabled = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isDisabled = false;
          });
        },
        onTap: () {
          if (!isDisabled) {
            widget.onTap();
          }
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: isDisabled ? AppColors.gray4 : AppColors.primary100,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 11),
              Icon(
                Icons.arrow_forward,
                color: AppColors.white,
                size: 16
              ),// Text(text),
            ],
          ),
        ),
      ),
    );
  }
}