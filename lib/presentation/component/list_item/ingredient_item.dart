import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/ingredient.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    ComponentConstant.borderRadius,
                  ),
                ),
                child: Image.network(
                  ingredient.imageUrl,
                ),
              ),
              Text(
                ingredient.name,
                style: TextStyles.normalTextBold,
              ),
            ],
          ),
          Text(
            '${ingredient.weight}g',
            style: TextStyles.smallTextRegular.copyWith(
              color: AppColors.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
