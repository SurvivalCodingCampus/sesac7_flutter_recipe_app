
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../ui/text_styles.dart';

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
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: widget.onClick,
        onTapDown: (details){
          setState(() {
            isPressed = false;
          });
        },
        onTapUp: (details){
          setState(() {
            isPressed = true;
          });
        },
        onTapCancel: (){
          setState(() {
            isPressed = true;
          });
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: isPressed ? AppColors.primary100 : AppColors.gray4,
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
                ),
              ),
              const SizedBox(width: 11),
              Icon(Icons.arrow_forward_outlined, color: AppColors.white)
            ],
          ),
        ),
      ),
    );
  }
}
