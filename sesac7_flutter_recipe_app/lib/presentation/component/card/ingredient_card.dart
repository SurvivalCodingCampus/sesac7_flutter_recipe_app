import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class IngredientCard extends StatelessWidget {
  final String name;
  final String image;
  final int amount;

  const IngredientCard({
    super.key,
    required this.name,
    required this.image,
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
                image,
                width: 40.0,
                height: 40.0,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              name,
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
