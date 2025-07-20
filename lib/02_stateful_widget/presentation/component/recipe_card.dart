import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';
import 'package:flutter_recipe_app/02_stateful_widget/data/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function() onClick;

  const RecipeCard({
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
        boxShadow: [
          // BoxShadow(
          //   color: Colors.black.withValues(),
          //   spreadRadius: 1,
          //   blurRadius: 4,
          //   offset: Offset(0, 2),
          // ),
        ],
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
                                style: TextStyles.smallTextBold.copyWith(
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
                      Column(
                        children: [
                          SizedBox(
                            width: 94,
                            height: 30,
                          ),
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
                              SizedBox(width: 10, height: 24),
                              GestureDetector(
                                onTap: onClick,
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
