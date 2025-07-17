import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';

class RatingButton extends StatefulWidget{

  final String text;
  final bool isSelected;
  final void Function() onClick;

  const RatingButton({
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 28,
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.primary100 : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primary100 ,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.primary100,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.star,
                  color: isSelected ? AppColors.white : AppColors.primary100,
                  size: 16
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}