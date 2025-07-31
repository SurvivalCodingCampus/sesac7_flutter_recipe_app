import 'package:flutter/material.dart';
import '../../../../domain/model/recipe.dart';
import '../../../../ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;
  final bool isBookmarked;

  const RecipeCard({
    super.key,
    required this.recipe,
    this.onTap,
    this.onBookmarkTap,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF8F5FF), // 연한 보라색 배경
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 배경 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                recipe.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFE0E0E0),
                          const Color(0xFFBDBDBD),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.restaurant,
                      size: 50,
                      color: Color(0xFF757575),
                    ),
                  );
                },
              ),
            ),

            // 그라데이션 오버레이 (더 부드럽게)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),

            // 별점 표시 (우상단)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color(0xFFFFD700),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe.rating.toStringAsFixed(1),
                      style: TextStyles.smallTextBold.copyWith(
                        fontSize: 12,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 북마크 버튼 (우측 중앙)
            Positioned(
              top: 50,
              right: 12,
              child: GestureDetector(
                onTap: onBookmarkTap,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 18,
                    color: isBookmarked
                        ? const Color(0xFF6B46C1)
                        : const Color(0xFF666666),
                  ),
                ),
              ),
            ),

            // 레시피 제목 (하단)
            Positioned(
              bottom: 50,
              left: 16,
              right: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 한국어 제목 (실제로는 recipe.name을 한국어로 표시)
                  Text(
                    recipe.name,
                    style: TextStyles.mediumTextBold.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  // 영어 제목 (실제로는 별도 필드가 필요)
                  Text(
                    _getEnglishTitle(recipe.name),
                    style: TextStyles.smallTextRegular.copyWith(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // 셰프 이름 (하단)
            Positioned(
              bottom: 20,
              left: 16,
              child: Text(
                'By ${recipe.chef}',
                style: TextStyles.smallTextRegular.copyWith(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.8),
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),

            // 시간 표시 (우하단)
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: Color(0xFF666666),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe.time,
                      style: TextStyles.smallTextRegular.copyWith(
                        fontSize: 12,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 임시로 한국어 제목을 영어로 변환하는 함수
  String _getEnglishTitle(String koreanTitle) {
    final titleMap = {
      '김치찌개': 'Kimchi Stew',
      '스테이크': 'Steak',
      '초밥': 'Sushi',
      '김밥': 'Gimbap',
      'Traditional spare ribs baked': 'Traditional Spare Ribs Baked',
      'spice roasted chicken with flavored rice':
          'Spice Roasted Chicken with Flavored Rice',
      'Spicy fried rice mix chicken bali': 'Spicy Fried Rice Mix Chicken Bali',
      'Lamb chops with fruity': 'Lamb Chops with Fruity',
    };

    return titleMap[koreanTitle] ?? koreanTitle;
  }
}
