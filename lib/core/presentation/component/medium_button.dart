import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final String text;
  final void Function() onClick;

  const MediumButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
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
        width: 243,
        height: 54,
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        decoration: BoxDecoration(
          color: isClicked ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 114,
              height: 24,
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyles.normalTextBold.copyWith(
                  color: AppColors.white,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              width: 9,
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
