
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

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
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (details){
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (details){
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: (){
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          color: isPressed ? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          width: 114,
          child: Text(
            widget.text,
            style: TextStyles.smallerTextBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
