import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const SearchRecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150 / 150,
      child: Container(
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
                      width: 3.0,
                    ),
                    SizedBox(
                      child: Text(
                        recipe.rating.toString(),
                        style: TextStyles.searchRecipeCardRatingValue,
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
              right: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      recipe.name,
                      style: TextStyles.searchRecipeCardTitle,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    'By ${recipe.chef}',
                    style: TextStyles.searchRecipeCardChef,
                    maxLines: 1,
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
