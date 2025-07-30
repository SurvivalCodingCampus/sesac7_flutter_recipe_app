import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
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
                child: CachedNetworkImage(
                  imageUrl: ingredient.imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported),
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(),
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
