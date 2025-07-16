import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';

class FilterButton extends StatefulWidget{

  final String text;
  final bool isSelected;
  final void Function() onClick;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onClick();
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.white,
          border: Border.all(
            color: AppColors.primary100 ,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.primary100,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}