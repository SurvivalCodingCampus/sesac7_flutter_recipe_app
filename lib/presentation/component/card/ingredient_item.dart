import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../../../data/model/ingredients.dart';

class IngredientItem extends StatelessWidget {
  final Ingredients ingredients;

  const IngredientItem({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    final double ingredientItemCardWidth = 315.0;
    final double ingredientItemCardHeight = 76.0;
    final imageWidth = 52.0;
    final imageHeight = 52.0;

    return Container(
      width: ingredientItemCardWidth,
      height: ingredientItemCardHeight,
      padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            //자식 위젯을 둥근 모서리를 가진 사각형(Rounded Rectangle) 모양으로 잘라내는(Clip) 역할을 하는 위젯
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: imageWidth,
              height: imageHeight,
              color: AppColors.white,
              child: Image.network(
                // 네트워크(인터넷)에 있는 URL로부터 이미지를 가져와 화면에 보여주는 역할 // 비동기 내부에서 처리
                ingredients.image,
                fit: BoxFit.contain,
                /*
                 image 로딩실패시 표시 위젯
                 errorBuilder: (context, error, stackTrace) {
                   return Container(
                     width: imageWidth,
                     height: imageHeight,
                     color: Colors.grey[300],
                     child: const Icon(Icons.image_not_supported, color: Colors.white),
                   );
                 },
*/
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              ingredients.name,
              style: TextStyles.normalTextBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Text(
            '500g',
            style: TextStyles.smallTextBold.copyWith(
              color: AppColors.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
