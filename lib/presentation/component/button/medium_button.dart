
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

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
        width: 243,
        height: 54,
        decoration: BoxDecoration(
          color: isPressed ? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 114,
              child: Text(
                widget.text,
                style: TextStyles.normalTextBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 11),
            Icon(Icons.arrow_forward_outlined, color: AppColors.white)
          ],
        ),
      ),
    );
  }
}
