import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final void Function() onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
        // width: 174,
        height: 37,
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        decoration: BoxDecoration(
          color: isClicked ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: Duration(milliseconds: 100),
        child: SizedBox(
          // width: 114,
          height: 17,
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyles.smallerTextBold.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
