import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class RatingButton extends StatefulWidget {
  final String? rating;
  final bool initialIsSelected;
  final VoidCallback onTap;
  final bool isSelected;

  const RatingButton({
    super.key,
    this.rating,
    this.initialIsSelected = false,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColor.Primary100 : AppColor.White,
          border: Border.all(color: AppColor.Primary100, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.rating ?? '0',
              style: TextStyle(
                color: widget.isSelected ? AppColor.White : AppColor.Primary100,
                fontSize: 11,
                height: 1.5,
              ),
            ),
            const SizedBox(width: 3),
            Icon(
              Icons.star,
              color: widget.isSelected ? AppColor.White : AppColor.Primary100,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}