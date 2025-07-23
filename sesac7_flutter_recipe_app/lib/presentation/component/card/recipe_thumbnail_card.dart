import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeThumbnailCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onFavoritePressed;

  const RecipeThumbnailCard({
    super.key,
    required this.recipe,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 315.0 / 150.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(recipe.image),
              fit: BoxFit.cover,
              onError: (exception, stacktrace) {
                throw Exception('RecipeThumbnailCard Image Load Error');
              }
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.black,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
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
                      size: 8.0,
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    SizedBox(
                      child: Text(
                        recipe.rating.toString(),
                        style: TextStyles.recipeCardRatingValue,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        size: 17.0,
                        color: AppColors.gray4,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        recipe.time,
                        style: TextStyles.recipeCardTime,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: onFavoritePressed,
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.bookmark_border_rounded,
                          color: AppColors.primary80,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
