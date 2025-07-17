import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';

import '../../data/model/ingredient_model.dart';
import '../../data/model/recipe.dart';
import '../component/button/big_button.dart';
import '../component/button/medium_button.dart';
import '../component/button/rating_button.dart';
import '../component/button/small_button.dart';
import '../component/card/ingredient_item.dart';
import '../component/card/recipe_card.dart';

class TestScreen1 extends StatelessWidget {
  const TestScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IngredientItem(
                  ingredient: IngredientModel(
                    name: 'Avocado',
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2020/01/02/01/43/avocado-4734786_1280.jpg',
                    quantity: '500g',
                  ),
                ),
                SizedBox(height: 10),
                RecipeCard(
                  recipe: Recipe(
                    id: 8,
                    category: "Japanese",
                    name: "Sushi Platter",
                    image: "https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg",
                    chef: "Jiro Ono",
                    time: "60 min",
                    rating: 4.8,
                    ingredients: [

                    ]
                  ),
                  saveRecipeCallback: (String recipeId) {
                    print('recipe ID : $recipeId');
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    RatingButton(
                      text: '53333335',
                      isSelected: true, // 상태 변수를 isSelected에 전달
                      onSelectedCallback: (newIsSelected) {
                        print('RatingButton 상태 변경됨: $newIsSelected'); // 콘솔 출력
                      },
                    ),
                    SizedBox(width: 10),
                    RatingButton(
                      text: '53333335',
                      isSelected: false, // 상태 변수를 isSelected에 전달
                      onSelectedCallback: (newIsSelected) {
                        // 콜백이 호출될 때 setState를 사용하여 상태 업데이트
                        print('RatingButton 상태 변경됨: $newIsSelected'); // 콘솔 출력
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    FilterButton(
                      text: 'text 버튼 입니다.(활성)',
                      isSelected: true,
                      onSelectedCallback: (newIsSelected) {},
                    ),
                    SizedBox(width: 10),
                    FilterButton(
                      text: 'text 버튼 입니다.(비활성)',
                      isSelected: false,
                      onSelectedCallback: (newIsSelected) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                BigButton(
                  text: 'Button',
                  onClick: () {
                    print('Big Button Clicked!');
                  },
                ),
                SizedBox(height: 10),
                MediumButton(
                  text: 'Button',
                  onClick: () {
                    print('Medium Button Clicked!');
                  },
                ),
                SizedBox(height: 10),
                SmallButton(
                  text: 'Button',
                  onClick: () {
                    print('Small Button Clicked!');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
