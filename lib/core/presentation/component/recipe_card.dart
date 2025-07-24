import 'package:flutter/material.dart';
import '../../domain/model/recipe.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookmarked;
  final void Function()? onBookmarkTap;
  final bool? isShowTime;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.isBookmarked,
    this.onBookmarkTap,
    this.isShowTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(recipe.image ?? ''),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, AppColors.black.withAlpha(255)],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.rating, size: 16),
                      const SizedBox(width: 3),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: AppTextStyles.smallerRegular.copyWith(
                          color: AppColors.black,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            // 제목
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 레시피 이름 & 셰프
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name ?? '',
                        style: AppTextStyles.smallBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        recipe.chef ?? '',
                        style: AppTextStyles.smallerRegular.copyWith(
                          color: AppColors.white,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),

                // 시간 + 북마크
                (isShowTime ?? false)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start, // 중앙 정렬
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: AppColors.gray4,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                recipe.time ?? '',
                                style: AppTextStyles.smallerRegular.copyWith(
                                  color: AppColors.gray4,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: onBookmarkTap,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isBookmarked
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    size: 16,
                                    color: AppColors.primary100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
