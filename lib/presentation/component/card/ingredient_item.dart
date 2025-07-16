
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../../data/model/ingredient_model.dart';
import '../../../ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  final IngredientModel ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12)),
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: 15),

      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Image.network(
              ingredient.imageUrl,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              ingredient.name,
              style: TextStyles.normalTextBold.copyWith(color: AppColors.colour),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            ingredient.quantity,
            style: TextStyles.smallTextRegular.copyWith(color: AppColors.gray3),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: SafeArea(
          child: IngredientItem(
            ingredient: IngredientModel(
              name: 'Avocado',
              imageUrl:
                  'https://cdn.pixabay.com/photo/2020/01/02/01/43/avocado-4734786_1280.jpg',
              quantity: '500g',
            ),
          ),
        ),
      ),
    ),
  );
}
