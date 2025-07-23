import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  final int amount;

  const IngredientCard({
    super.key,
    required this.ingredient,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(
                ingredient.image,
                width: 40.0,
                height: 40.0,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              ingredient.name,
              style: TextStyles.ingredientCardTitle,
              textAlign: TextAlign.left,
            ),
            Spacer(),
            Text(
              '${amount}g',
              style: TextStyles.ingredientCardAmount,
            )
          ],
        ),
      ),
    );
  }
}
