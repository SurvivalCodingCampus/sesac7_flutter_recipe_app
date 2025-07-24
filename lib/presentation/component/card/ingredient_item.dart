
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../domain/model/recipe_ingredient.dart';
import '../../../ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  final RecipeIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12)),
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: 15),

      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Image.network(
              ingredient.ingredient.image,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              ingredient.ingredient.name,
              style: TextStyles.normalTextBold.copyWith(color: AppColors.colour),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            '${ingredient.amount}g',
            style: TextStyles.smallTextRegular.copyWith(color: AppColors.gray3),
          ),
        ],
      ),
    );
  }
}
