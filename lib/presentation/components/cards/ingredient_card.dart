import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../../../data/model/ingredient.dart';

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientCard({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.gray4.withAlpha(255 ~/ 2), //50% opacity
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              ingredient.imageUrl,
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ingredient.title,
                  style: TextStyles.normalTextBold,
                ),
                Text(
                  '${ingredient.quantity}g',
                  style: TextStyles.smallTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

void main() {
  final tomatos = Ingredient(
    title: 'Tomatos',
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
    quantity: 500,
  );
  runApp(MaterialApp(home: Scaffold(body: Center(child: IngredientCard(ingredient: tomatos)))));
}
