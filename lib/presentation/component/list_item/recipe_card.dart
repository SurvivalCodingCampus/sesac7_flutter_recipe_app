import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
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
      width: 315,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(recipe.imageUrl).image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
      ),
      // clipBehavior: Clip.hardEdge,
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
            top: 10,
            right: 10,
            child: Container(
              width: 37,
              height: 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 3.25,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.rating,
                    size: 7,
                  ),
                  Text(
                    recipe.rating.toStringAsFixed(1),
                    style: TextStyles.smallerTextRegular.copyWith(fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      recipe.name,
                      style: TextStyles.smallTextBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'By ${recipe.creator}',
                      style: TextStyles.smallerTextRegular.copyWith(
                        fontSize: 8,
                        color: AppColors.gray4,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 17,
                          color: AppColors.gray4,
                        ),
                        Text(
                          '${recipe.cookingTime.inMinutes} min',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray4,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onBookmarkTap,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.bookmark_outline,
                          size: 13,
                          color: AppColors.primary80,
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
