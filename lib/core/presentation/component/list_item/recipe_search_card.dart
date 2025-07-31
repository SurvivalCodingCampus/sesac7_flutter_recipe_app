import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeSearchCard extends StatelessWidget {
  static const double positionedPadding = 10;
  static const double ratingBoxWidth = 37;
  static const double ratingBoxHeight = 16;
  static const double ratingBoxBorderRadius = 20;
  static const double ratingIconSize = 8;
  static const double smallerTextSize = 8;

  final Recipe recipe;

  const RecipeSearchCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                Icon(Icons.image_not_supported),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withAlpha(200),
                ],
              ),
              borderRadius: BorderRadius.circular(
                ComponentConstant.borderRadius,
              ),
            ),
          ),
          Positioned(
            top: positionedPadding,
            right: positionedPadding,
            child: Container(
              width: ratingBoxWidth,
              height: ratingBoxHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.secondary20,
                borderRadius: BorderRadius.circular(ratingBoxBorderRadius),
              ),
              child: Row(
                spacing: 3.25,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.rating,
                    size: ratingIconSize,
                  ),
                  Text(
                    recipe.rating.toStringAsFixed(1),
                    style: TextStyles.smallerTextRegular.copyWith(
                      fontSize: smallerTextSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: positionedPadding,
            left: positionedPadding,
            right: positionedPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recipe.name,
                  style: TextStyles.smallerTextBold.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'By ${recipe.creator}',
                  style: TextStyles.smallerTextRegular.copyWith(
                    fontSize: smallerTextSize,
                    color: AppColors.gray4,
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
