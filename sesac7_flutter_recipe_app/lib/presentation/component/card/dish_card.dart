import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookmark;
  final Function(Recipe recipe) onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.isBookmark,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150.0 / 231.0,
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 176.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColors.gray4,
              ),
            ),
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 109.0,
                  height: 110.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/home_category_image_sample.jpg',
                      ),
                      // image: NetworkImage(recipe.image), fixme 원현 이미지가 아님
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    recipe.name,
                    style: TextStyles.dishCardTitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time',
                            style: TextStyles.dishCardTimeTitle,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            recipe.time,
                            style: TextStyles.dishCardTime,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      BookmarkButton(
                        isSelected: isBookmark,
                        onFavoritePressed: () {
                          onTapFavorite(recipe);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 7.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary20,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.rating,
                    size: 10.0,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  SizedBox(
                    child: Text(
                      recipe.rating.toString(),
                      style: TextStyles.dishCardRatingValue,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
