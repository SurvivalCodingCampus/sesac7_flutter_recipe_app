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
  // 이미 _으로 프라이빗하게 되어있어서 외부에서 접근은 불가
  // 필드에 프라이빗한 필드를 사용해서 의도와 가독성을 높임
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: (){
        setState(() {
          isPressed = false;
        });
      },
      onTap: () {
        if (!isPressed) {
          isPressed = false;
        } widget.onTap();
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: isPressed ? AppColors.gray4 : AppColors.primary100,
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
    );
  }
}