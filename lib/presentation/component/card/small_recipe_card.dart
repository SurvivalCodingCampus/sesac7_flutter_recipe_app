import 'package:flutter/material.dart';

import '../../../domain/model/recipe.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SmallRecipeCard extends StatelessWidget {
  const SmallRecipeCard({
    super.key,
    required this.recipe,
    required this.saveRecipeCallback,
  });

  final Recipe recipe;
  final void Function(String recipeId) saveRecipeCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias, // Card 자체의 클리핑
      child: Stack(
        children: [
          // 배경 이미지 - ClipRRect로 감싸 이미지 자체를 클리핑합니다.
          ClipRRect(
            borderRadius: BorderRadius.circular(16), // Card와 동일한 라운드 값
            child: Image.network(
              recipe.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter, // 그라데이션 시작점: 컨테이너의 하단 중앙
                  end: Alignment.bottomCenter, // 그라데이션 끝점: 컨테이너의 상단 중앙
                  colors: const [
                    // 그라데이션 색상 리스트
                    Colors.transparent, // 상단 끝 지점의 색상 (완전 투명)
                    Colors.black, // 하단 시작 지점의 색상 (완전 불투명 검정)
                  ],
                  // 여기서는 기본값 (0.0과 1.0)을 사용하여 부드럽게 전환
                ),
              ),
            ),
          ),

          // 내용 (텍스트 + 아이콘들)
          Container(
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // 별점
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary20,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '${recipe.rating}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    // 타이틀
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        recipe.name,
                        style: TextStyles.smallTextBold.copyWith(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // 세프 이름
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'By Chef ${recipe.chef}',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.white,
                          fontSize: 8,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
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