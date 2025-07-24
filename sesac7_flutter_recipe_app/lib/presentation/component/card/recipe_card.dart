import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/bookmark_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookmark;
  final Function(int id) onTap;
  final VoidCallback onFavoritePressed;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.isBookmark,
    required this.onTap,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(recipe.id);
      },
      child: Center(
        child: Container(
          width: 315.0,
          height: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(recipe.image),
              fit: BoxFit.cover,
              onError: (exception, stacktrace) {
                throw Exception('RecipeCard Image Load Error');
              },
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
                left: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        recipe.name,
                        style: TextStyles.recipeCardTitle,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      'By ${recipe.chef}',
                      style: TextStyles.recipeCardChef,
                      maxLines: 1,
                    ),
                  ],
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
                    BookmarkButton(
                      isSelected: isBookmark,
                      onFavoritePressed: onFavoritePressed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
