import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../data/model/recipes.dart';

class RecipeCard extends StatelessWidget {
  final Recipes recipe;
  final void Function() onBookmarkPressed;

  const RecipeCard({super.key, required this.onBookmarkPressed, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.0,
      height: 150.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              //Positioned.fill은 자식 위젯이 Stack의 전체 공간을 채우도록 만듬
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  // 修正 받아와서 이미지로 뿌려줘야함
                  recipe.image,
                  fit: BoxFit.cover,
                  // 이미지 로딩 실패 시 에러 아이콘을 보여줍니다.
                  // errorBuilder: (context, error, stackTrace) {
                  //   return Container(
                  //     color: Colors.grey[300],
                  //     child: const Icon(Icons.broken_image, color: Colors.white),
                  //   );
                  // },
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // 자식들을 위쪽 끝과 아래쪽 끝으로 밀어냄
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // 자식들을 오른쪽 끝으로 정렬
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16.0,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '4.5', // 修正 수정 필요
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column( //하단의 레시피 정보
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            recipe.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              recipe.chef,
                              style: TextStyle(
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  recipe.time,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 16),
                                GestureDetector(
                                  onTap: onBookmarkPressed,
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: Colors.white24,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      recipe.isBookmarked ? Icons.bookmark : Icons.bookmark_border, // 修正
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
}
