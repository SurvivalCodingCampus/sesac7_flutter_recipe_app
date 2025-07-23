import 'package:flutter/material.dart';
import '../../../domain/model/ingredient.dart';
import '../../../../ui/text_styles.dart';


class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white, // 여기서 흰 배경 처리
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              child: Image.network(
                ingredient.image,
                width: 52,
                height: 52,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              ingredient.name,
              style: AppTextStyles.normalBold
            )
          ),
          Text(
            ingredient.amount,
            style: AppTextStyles.smallerRegular.copyWith(
              color: Colors.grey,
            )
          ),
        ],
      )
    );
  }
}