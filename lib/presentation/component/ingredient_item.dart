import 'package:flutter/material.dart';

import '../../data/model/ingredient.dart';
import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
        color: AppColors.gray4.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            margin: EdgeInsets.fromLTRB(15, 12, 0, 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(ingredient.image),
              ),
              // color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 16,
            height: 24,
          ),
          Expanded(
            child: Container(
              // width: 73,
              margin: EdgeInsets.fromLTRB(0, 29, 0, 23),
              height: 24,
              child: Text(
                ingredient.name,
                style: TextStyles.normalTextBold,
              ),
            ),
          ),
          SizedBox(
            width: 108,
            height: 24,
          ),
          Container(
            height: 21,
            margin: EdgeInsets.fromLTRB(0, 28, 15, 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ingredient.amount}g',
                  style: TextStyles.smallTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
