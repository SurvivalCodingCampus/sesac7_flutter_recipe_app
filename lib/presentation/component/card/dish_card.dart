import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../domain/model/recipe.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe; // 레시피 데이터
  final ValueChanged<Recipe> onTapFavorite; // 즐겨찾기 버튼 탭 시 콜백

  const DishCard({
    Key? key,
    required this.recipe,
    required this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // 카드 너비
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray3.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // 그림자 효과
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              recipe.image,
              height: 120, // 이미지 높이
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: double.infinity,
                  color: AppColors.gray3,
                  child: Center(
                    child: Icon(Icons.broken_image, color: AppColors.gray4),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                /*Row(
                  children: [
                    RatingBarIndicator(
                      rating: recipe.rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18.0, // 별 크기
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe.rating.toStringAsFixed(1), // 평점을 소수점 한 자리까지 표시
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),*/
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.grey[600],
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe.time,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        onTapFavorite(recipe); // 즐겨찾기 콜백 호출
                      },
                      child: Icon(
                        recipe.isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: recipe.isSaved ? Colors.red : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}