import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../domain/model/recipe.dart';
import '../../../ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe; // 레시피 데이터
  final ValueChanged<Recipe> onTapFavorite; // 즐겨찾기 버튼 탭 시 콜백

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    // 카드 전체 너비 (150)에서 이미지 너비 (110)를 뺀 후 절반으로 나눠 좌측 여백 계산
    final double imageLeftOffset = (150 - 110) / 2;
    // 이미지 높이 (110)의 절반
    final double imageHalfHeight = 110 / 2;

    return Container(
      width: 150,
      // 카드 너비
      height: 240,
      // 카드 전체 높이
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
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
      child: Stack(
        // Stack은 자식들을 겹쳐서 배치합니다.
        // 리스트의 나중에 오는 위젯이 더 위에 그려집니다.
        children: [
          // 1. 컨텐츠 영역 (카드 하단)
          // 이 컨테이너가 먼저 그려져서 이미지가 그 위로 겹쳐지도록 합니다.
          Positioned(
            bottom: 0, // 카드의 맨 아래에 정렬
            left: 0, // 카드의 왼쪽 끝에 정렬
            right: 0, // 카드의 오른쪽 끝에 정렬 (width: 150과 동일 효과)
            child: Container(
              width: 150,
              // 부모 Stack의 너비와 동일하게 설정
              height: 176,
              // 컨텐츠 영역의 높이
              padding: EdgeInsets.only(
                top: imageHalfHeight + 10, // 이미지 겹치는 부분 + 텍스트와의 여백
                left: 10,
                right: 10,
                bottom: 10,
              ),
              // 컨텐츠 배경색을 지정하여 이미지와 구분되게 합니다.
              decoration: BoxDecoration(
                color: AppColors.gray4,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 좌측 정렬
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(), // 남은 공간을 차지하여 아래 Row를 하단으로 밀어냄
                  Text(
                    'Time',
                    style: TextStyles.smallerTextRegular.copyWith(color: AppColors.gray3),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(
                        recipe.time,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.gray3,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          onTapFavorite(recipe); // 즐겨찾기 콜백 호출
                        },
                        child: Icon(
                          recipe.isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: recipe.isSaved ? Colors.red : Colors.grey[600],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 2. 원형 이미지 영역 (카드 상단 중앙)
          // 이 컨테이너는 컨텐츠 영역 위에 그려져야 하므로 목록에서 나중에 배치됩니다.
          Positioned(
            top: 0, // 카드의 맨 위에 정렬
            left: imageLeftOffset, // 계산된 값으로 중앙 정렬
            child: Container(
              height: 110, // 이미지 컨테이너 높이
              width: 110, // 이미지 컨테이너 너비
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0), // 원형 이미지 테두리
                color: AppColors.gray3, // 이미지 컨테이너 자체의 배경색 (이미지 로딩 전이나 오류 시 보임)
                border: Border.all(
                  color: const Color(0xFF202020).withAlpha(15),
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray3.withValues(alpha: 0.2),
                    // 이미지에도 그림자 추가
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0), // 이미지를 원형으로 클리핑
                child: Image.network(
                  recipe.image,
                  fit: BoxFit.cover,
                  height: 110,
                  width: 110,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 110,
                      width: 110,
                      color: AppColors.gray3, // 이미지 로딩 오류 시 배경색
                      child: Center(
                        child: Icon(Icons.broken_image, color: AppColors.gray4),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
