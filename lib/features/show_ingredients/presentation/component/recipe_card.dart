import 'package:flutter/material.dart';

import '../../../../core/data/recipe/domain/model/recipe.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(int id) onClick;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                    child: SizedBox(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.smallTextBold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              recipe.chef,
                              style: TextStyles.smallerTextRegular.copyWith(
                                fontSize: 8,
                                color: AppColors.gray4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: AppColors.gray4,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    recipe.cookingTime,
                                    style: TextStyles.smallTextRegular.copyWith(
                                      color: AppColors.gray4,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  onClick(recipe.id);
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    size: 16,
                                    color: AppColors.primary80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
