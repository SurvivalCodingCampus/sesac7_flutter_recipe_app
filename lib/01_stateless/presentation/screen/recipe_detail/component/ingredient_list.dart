import 'package:flutter/material.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      {
        'name': 'Tomatos',
        'amount': '500g',
        'image': 'https://example.com/tomato.jpg',
      },
      {
        'name': 'Cabbage',
        'amount': '300g',
        'image': 'https://example.com/cabbage.jpg',
      },
      {
        'name': 'Taco',
        'amount': '300g',
        'image': 'https://example.com/taco.jpg',
      },
      {
        'name': 'Slice Bread',
        'amount': '300g',
        'image': 'https://example.com/bread.jpg',
      },
      {
        'name': 'Green onion',
        'amount': '300g',
        'image': 'https://example.com/onion.jpg',
      },
      {
        'name': 'Omelette',
        'amount': '300g',
        'image': 'https://example.com/omelette.jpg',
      },
      {
        'name': 'Hot Dog',
        'amount': '300g',
        'image': 'https://example.com/hotdog.jpg',
      },
      {
        'name': 'Oninon',
        'amount': '300g',
        'image': 'https://example.com/onion.jpg',
      },
      {
        'name': 'Lettuce',
        'amount': '300g',
        'image': 'https://example.com/lettuce.jpg',
      },
      {
        'name': 'Spinach',
        'amount': '300g',
        'image': 'https://example.com/spinach.jpg',
      },
      {
        'name': 'Red & Green Chilli',
        'amount': '300g',
        'image': 'https://example.com/chilli.jpg',
      },
      {
        'name': 'Fries',
        'amount': '300g',
        'image': 'https://example.com/fries.jpg',
      },
      {
        'name': 'Chicken',
        'amount': '300g',
        'image': 'https://example.com/chicken.jpg',
      },
      {
        'name': 'Burger',
        'amount': '300g',
        'image': 'https://example.com/burger.jpg',
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: ingredients.map((ingredient) {
          return Container(
            width: 315,
            height: 76,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.gray4.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // 재료 이미지
                Container(
                  margin: const EdgeInsets.all(12),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      ingredient['image']!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 40,
                          height: 40,
                          color: AppColors.gray4,
                          child: const Icon(
                            Icons.restaurant,
                            size: 20,
                            color: AppColors.gray2,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // 재료 이름
                Expanded(
                  child: Text(
                    ingredient['name']!,
                    style: TextStyles.mediumTextBold.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ),

                // 재료 양
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Text(
                    ingredient['amount']!,
                    style: TextStyles.normalTextRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.gray3,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
