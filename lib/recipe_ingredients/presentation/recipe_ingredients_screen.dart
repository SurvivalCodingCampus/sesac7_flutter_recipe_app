import 'package:flutter/material.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';
import '../../../core/presentation/component/recipe_card.dart';
import '../../core/domain/model/recipe.dart';

class RecipeIngredientsScreen extends StatelessWidget {

  final int recipeId;
  const RecipeIngredientsScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('레시피 ID: $recipeId'),
            // RecipeCard(
            //   recipe: Recipe(id: recipeId),
            //   isBookmarked: true,
            //   onBookmarkTap: () {},
            //   isShowTime: true,
            // ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Ingredients',
                    style: AppTextStyles.smallBold.copyWith(
                      color: AppColors.primary100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Procedure',
                    style: AppTextStyles.smallRegular.copyWith(
                      color: AppColors.gray4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),

            const SizedBox(height: 30),
            Text(
              'Ingredients',
              style: AppTextStyles.smallRegular.copyWith(
                color: AppColors.gray2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
