import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  static const double imageSpacing = 16;
  static const double imageSize = 52;
  static const EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 12,
  );

  final Ingredient ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: imageSpacing,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    ComponentConstant.borderRadius,
                  ),
                ),
                child: Image.network(
                  ingredient.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                      ? child
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
              Text(
                ingredient.name,
                style: TextStyles.normalTextBold,
              ),
            ],
          ),
          Text(
            '${ingredient.weight.toStringAsFixed(ingredient.weight == ingredient.weight.roundToDouble() ? 0 : 1)}g',
            style: TextStyles.smallTextRegular.copyWith(
              color: AppColors.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
