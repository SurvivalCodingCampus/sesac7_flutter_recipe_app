import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';

class BookmarkButton extends StatelessWidget {
  final int size;
  final int innerSize;
  final void Function() onClick;
  final bool isAdded;

  const BookmarkButton({
    super.key,
    required this.size,
    required this.innerSize,
    required this.onClick,
    required this.isAdded
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: size.toDouble(),
        height: size.toDouble(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            Icons.bookmark_border_outlined,
            size: innerSize.toDouble(),
            color: isAdded ? AppColors.primary80 : AppColors.gray3,
          ),
        ),
      ),
    );
  }
}
