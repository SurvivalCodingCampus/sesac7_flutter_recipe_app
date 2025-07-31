import 'package:flutter/material.dart';
import '../../../../domain/model/recipe.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class RecipeDetailCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onBookmarkPressed;
  final bool isBookmarked;

  const RecipeDetailCard({
    super.key,
    required this.recipe,
    required this.onBookmarkPressed,
    required this.isBookmarked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 201,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          // 배경 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              recipe.imageUrl,
              width: 315,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 315,
                  height: 150,
                  color: AppColors.gray4,
                  child: const Icon(
                    Icons.restaurant,
                    size: 50,
                    color: AppColors.gray2,
                  ),
                );
              },
            ),
          ),

          // 그라데이션 오버레이
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.0),
                    Colors.black.withValues(alpha: 1.0),
                  ],
                ),
              ),
            ),
          ),

          // 별점 표시 (우상단)
          Positioned(
            top: 10,
            right: 37,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    size: 8,
                    color: AppColors.rating,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    recipe.rating.toStringAsFixed(1),
                    style: TextStyles.smallerTextRegular.copyWith(
                      fontSize: 8,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 리뷰 수 표시
          Positioned(
            bottom: 160,
            right: 10,
            child: Text(
              '(13k Reviews)',
              style: TextStyles.mediumTextRegular.copyWith(
                fontSize: 14,
                color: AppColors.gray3,
              ),
            ),
          ),

          // 북마크 버튼 (우상단)
          Positioned(
            top: 116,
            right: 10,
            child: GestureDetector(
              onTap: onBookmarkPressed,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  size: 16,
                  color: AppColors.primary80,
                ),
              ),
            ),
          ),

          // 시간 표시 (우하단)
          Positioned(
            bottom: 116,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3.5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 17,
                    color: AppColors.gray4,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    recipe.time,
                    style: TextStyles.smallerTextRegular.copyWith(
                      fontSize: 11,
                      color: AppColors.gray4,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 레시피 제목 (하단)
          Positioned(
            bottom: 10,
            left: 5,
            child: SizedBox(
              width: 194,
              child: Text(
                recipe.name,
                style: TextStyles.smallTextBold.copyWith(
                  fontSize: 14,
                  color: AppColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
