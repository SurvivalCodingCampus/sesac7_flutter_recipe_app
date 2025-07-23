import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/cards/ingredient_card.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../../../data/model/ingredient.dart';

class IngredientsTabScreen extends StatelessWidget {
  final List<Ingredient> ingredients;

  const IngredientsTabScreen({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.rice_bowl, color: AppColors.gray3),
                Text(
                  '1 serve',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
            Text(
              '${ingredients.length} Items',
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray3,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IngredientCard(ingredient: ingredient),
              );
            },
          ),
        ),
      ],
    );
  }
}
