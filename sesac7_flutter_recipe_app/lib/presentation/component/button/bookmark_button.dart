import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class BookmarkButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onFavoritePressed;

  const BookmarkButton({
    super.key,
    required this.isSelected,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavoritePressed,
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: AppColors.white,
        ),
        child: Center(
          child: Icon(
            Icons.bookmark_border_rounded,
            color: isSelected ? AppColors.primary80 : AppColors.gray3,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
