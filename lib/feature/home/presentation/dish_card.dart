import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/recipe.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 231,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                color: AppColors.gray4,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                recipe.name,
                style: TextStyles.smallTextBold.copyWith(
                  color: AppColors.gray1,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.network(
              recipe.imageWithoutBackground,
              height: 110,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.star,
                    size: 10,
                    color: AppColors.rating,
                  ),
                  Text(
                    recipe.rating.toStringAsFixed(1),
                    style: TextStyles.smallerTextRegular,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              spacing: 5,
              children: [
                Text(
                  'Time',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
                Text(
                  recipe.cookingTime,
                  style: TextStyles.smallerTextBold.copyWith(
                    color: AppColors.gray1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () => onTapFavorite(recipe),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.bookmark_outline,
                    size: 16,
                    // TODO: User
                    color: AppColors.primary80,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
