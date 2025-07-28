import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/features/home/presentation/component/rating_container_in_dish_card.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;

  const DishCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 231,
      child: Stack(
        children: [
          Positioned(
            top: 55,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                color: AppColors.gray4,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      recipe.name,
                      style: TextStyles.smallTextBold.copyWith(
                        color: AppColors.gray1,
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: TextStyles.smallerTextRegular.copyWith(
                                color: AppColors.gray3,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              recipe.cookingTime,
                              style: TextStyles.smallerTextBold.copyWith(
                                color: AppColors.gray1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.bookmark_border,
                          size: 16,
                          color: AppColors.primary80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: SizedBox(
              width: 150,
              height: 110,
              child: Container(
                width: 109,
                height: 110,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      recipe.image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 105,
            top: 30,
            child: RatingContainerInDishCard(rating: '${recipe.rating}'),
          ),
        ],
      ),
    );
  }
}
