import 'package:flutter/material.dart';
import '../../../ui/app_colors.dart';

class BigButton extends StatelessWidget {
  final String text;
  // final void Function() onClick;
  // VoidCallback = void Function()
  final VoidCallback onClick;

  const BigButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primary100,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),

              ),
              // Text(text),
            ],
          ),
        ),
      ),
    );
  }
}