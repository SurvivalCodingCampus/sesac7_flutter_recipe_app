import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final String text;
  final void Function() onClick;

  const BigButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();

        // setState(() {
        //   isClicked = !isClicked;
        // });
      },
      onTapDown: (TapDownDetails tapDownDetails) {
        setState(() {
          isClicked = false;
        });
      },
      onTapUp: (TapUpDetails tapUpDetails) {
        setState(() {
          isClicked = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isClicked = true;
        });
      },
      child: AnimatedContainer(
        // width: 315,
        height: 60,
        padding: EdgeInsets.fromLTRB(85, 18, 85, 18),
        // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
          color: isClicked ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              height: 24,
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyles.normalTextBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              width: 11,
            ),
            Icon(
              size: 20,
              Icons.arrow_forward,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
