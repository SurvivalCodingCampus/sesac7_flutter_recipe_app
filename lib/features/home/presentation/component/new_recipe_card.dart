import 'package:flutter/material.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // top: 55,
          child: Container(
            width: 251,
            height: 95,
            margin: EdgeInsets.only(top: 32),
            padding: EdgeInsets.fromLTRB(9.3, 10, 9.3, 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    recipe.name,
                    style: TextStyles.smallTextBold.copyWith(
                      color: AppColors.gray1,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(recipe.rating.floor(), (index) {
                      return Icon(
                        Icons.star,
                        size: 12,
                        color: AppColors.rating,
                      );
                    }),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(recipe.image),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          'By ${recipe.chef}',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 17,
                          color: AppColors.gray3,
                        ),
                        SizedBox(width: 5),
                        Text(
                          recipe.cookingTime,
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 161.7,
          child: Container(
            width: 80,
            height: 86,
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
      ],
    );
  }
}
