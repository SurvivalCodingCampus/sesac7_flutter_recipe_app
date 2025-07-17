import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful/model/ingredient.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/ui/text_styles.dart';

import '../ui/app_colors.dart';

class IngredientItemWidget extends StatelessWidget {
  final Ingredient ingredient;
  final double width;

  const IngredientItemWidget({
    super.key,
    double? width,
    required this.ingredient,
  }) : width = width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width as num).toDouble(),
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 52,
                height: 52,
                margin: const EdgeInsets.fromLTRB(15, 12, 15, 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  image: DecorationImage(
                    image: AssetImage(ingredient.imgSrc),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 29),
                Text(
                  ingredient.name,
                  style: TextStyles.normalTextBold.copyWith(
                    color: AppColors.colour,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    '${ingredient.quantity}g',
                    style: TextStyles.smallTextRegular.copyWith(
                      color: AppColors.gray3,
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
