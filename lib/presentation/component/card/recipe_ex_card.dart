import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';

import '../../../domain/model/recipe.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class RecipeExCard extends StatelessWidget {
  const RecipeExCard({
    super.key,
    required this.recipe,
    required this.saveRecipeCallback,
  });

  final Recipe recipe;
  final void Function(String recipeId) saveRecipeCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // 별점
                        Row(
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
                        // 시간 그룹
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: AppColors.gray4,
                                  size: 17,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  recipe.time,
                                  style: TextStyles.smallerTextRegular.copyWith(
                                    color: AppColors.gray4,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                saveRecipeCallback(recipe.id.toString());
                              },
                              child: Icon(
                                Icons.bookmark_border,
                                color: recipe.isSaved ? AppColors.secondary100 : AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                recipe.name,
                style: TextStyles.smallTextBold.copyWith(
                  color: AppColors.black,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('(13k Reviews)',
                style: TextStyles.smallTextRegular.copyWith(
                  color: AppColors.gray3,
                  fontSize: 14,
                ),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/profile_another.png',
                width: 40,
                height: 40,
                // 또는 Image.network(...)
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.chef,
                  style: TextStyles.smallTextRegular.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min, // Row의 크기를 자식들의 크기에 맞춤 (선택 사항)
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/location.png', // 실제 이미지 경로
                      width: 17.0, // 원하는 아이콘 너비
                      height: 17.0, // 원하는 아이콘 높이
                      fit: BoxFit.contain, // 이미지 비율 유지하며 크기 조절
                    ),

                    Text('Lagos, Nigeria', style: TextStyle(fontSize: 16.0)), // 텍스트
                  ],
                ),
              ],
            ),
            Spacer(),
            SmallButton(width: 85, text: 'Follow', onClick: (){})
          ],
        ),
      ],
    );
  }
}
