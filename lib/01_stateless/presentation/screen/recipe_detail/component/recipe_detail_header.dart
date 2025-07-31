import 'package:flutter/material.dart';
import '../../../../ui/app_colors.dart';

class RecipeDetailHeader extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onMorePressed;

  const RecipeDetailHeader({
    super.key,
    required this.onBackPressed,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 뒤로가기 버튼
          GestureDetector(
            onTap: onBackPressed,
            child: const SizedBox(
              width: 20,
              height: 20,
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: AppColors.black,
              ),
            ),
          ),

          // 더보기 버튼
          GestureDetector(
            onTap: onMorePressed,
            child: const SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                Icons.more_vert,
                size: 24,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
