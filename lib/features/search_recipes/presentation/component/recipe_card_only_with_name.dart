import 'package:flutter/material.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class RecipeCardOnlyWithName extends StatelessWidget {
  final Recipe recipe;
  final void Function() onClick;

  const RecipeCardOnlyWithName({
    super.key,
    required this.recipe,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 315,
      height: 150,
      // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(recipe.image),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.2),
                      AppColors.black.withValues(alpha: 0.9),
                    ],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Container(
                        width: 37,
                        height: 16,
                        // padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
                        // margin: EdgeInsets.only(left: 255),
                        decoration: BoxDecoration(
                          color: AppColors.secondary20,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: AppColors.rating, size: 7),
                            SizedBox(width: 3),
                            Text(
                              '${recipe.rating}',
                              style: TextStyles.smallTextRegular.copyWith(
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                recipe.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.smallerTextBold.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            Text(
                              'By ${recipe.chef}',
                              style: TextStyles.smallerTextRegular.copyWith(
                                fontSize: 8,
                                color: AppColors.gray4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
