import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  static const double width = 315;
  static const double height = 150;
  static const double positionedPadding = 10;
  static const double ratingBoxWidth = 37;
  static const double ratingBoxHeight = 16;
  static const double ratingBoxBorderRadius = 20;
  static const double ratingIconSize = 8;
  static const double smallerTextSize = 8;
  static const double timerIconSize = 17;
  static const double bookmarkButtonSize = 24;
  static const double bookmarkIconSize = 13;

  final Recipe recipe;
  final VoidCallback onBookmarkTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(recipe.imageUrl).image,
          fit: BoxFit.cover,
          onError: (exception, stackTrace) =>
              const Icon(Icons.image_not_supported),
        ),
        borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
      ),
      child: Stack(
        children: [
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        recipe.name,
                        style: TextStyles.smallTextBold.copyWith(
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
                Row(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: timerIconSize,
                          color: AppColors.gray4,
                        ),
                        Text(
                          recipe.cookingTime,
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray4,
                          ),
                        ),
                      ],
                    ),
                    Material(
                      color: AppColors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: onBookmarkTap,
                        customBorder: const CircleBorder(),
                        child: SizedBox(
                          width: bookmarkButtonSize,
                          height: bookmarkButtonSize,
                          child: Icon(
                            Icons.bookmark_outline,
                            size: bookmarkIconSize,
                            color: AppColors.primary80,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
