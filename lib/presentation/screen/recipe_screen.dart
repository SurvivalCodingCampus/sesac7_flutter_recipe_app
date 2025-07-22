import 'package:flutter/material.dart';

import '../../data/model/ingredient.dart';
import '../../data/model/recipe.dart';
import '../component/big_button.dart';
import '../component/clicked_filter_button.dart';
import '../component/clicked_rating_button.dart';
import '../component/ingredient_item.dart';
import '../component/medium_button.dart';
import '../component/rating_dialog.dart';
import '../component/recipe_card.dart';
import '../component/small_button.dart';
import '../component/unclicked_filter_button.dart';
import '../component/unclicked_rating_button.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isRatingButtonSelected = false;
  bool isFilterButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            IngredientItem(
              ingredient: Ingredient(
                id: 1,
                name: 'Tomatos',
                image:
                    'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
              ),
              quantity: 500,
            ),
            SizedBox(height: 20),
            RecipeCard(
              recipe: Recipe(
                category: 'Indian',
                id: 1,
                name: 'Traditional spare ribs\nbaked',
                image:
                    'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
                chef: 'Chef John',
                cookingTime: '20 min',
                rating: 4.0,
                ingredients: [
                  Ingredient(
                    id: 1,
                    name: 'Tomatos',
                    image:
                        'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
                  ),
                ],
              ),
              onClick: () {
                print('북마크되었습니다.');
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isRatingButtonSelected = !isRatingButtonSelected;
                    });
                  },
                  child: isRatingButtonSelected
                      ? ClickedRatingButton(
                          text: '5',
                          isSelected: isRatingButtonSelected,
                        )
                      : UnclickedRatingButton(
                          text: '5',
                          isSelected: isRatingButtonSelected,
                          onClick: () {},
                        ),
                ),
                SizedBox(width: 20),
                UnclickedRatingButton(
                  text: '5',
                  isSelected: false,
                  onClick: () {},
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return UnconstrainedBox(
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              content: RatingDialog(
                                title: 'Rate recipe',
                                actionName: 'Send',
                                onChange: (int rating) {
                                  print('현재 선택된 점수는 $rating점 입니다.');
                                },
                              ),
                            ),
                          );
                        },
                      );
                      isFilterButtonSelected = !isFilterButtonSelected;
                    });
                  },
                  child: isFilterButtonSelected
                      ? ClickedFilterButton(
                          text: 'Text',
                          isSelected: isFilterButtonSelected,
                        )
                      : UnclickedFilterButton(
                          text: 'Text',
                          isSelected: isFilterButtonSelected,
                          onClick: () {},
                        ),
                ),
                SizedBox(width: 20),
                UnclickedFilterButton(
                  text: 'Text',
                  isSelected: isFilterButtonSelected,
                  onClick: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            BigButton(
              text: 'Button',
              onClick: () {
                print('큰 버튼 클릭되었어요');
              },
            ),
            SizedBox(height: 20),
            MediumButton(
              text: 'Button',
              onClick: () {
                print('중간 버튼 클릭되었어요');
              },
            ),
            SizedBox(height: 20),
            SmallButton(
              text: 'Button',
              onClick: () {
                print('작은 버튼 클릭되었어요');
              },
            ),
            SizedBox(height: 20),
            RatingDialog(
              title: 'Rate recipe',
              actionName: 'Send',
              onChange: (int rating) {
                print('현재 선택된 점수는 $rating점 입니다.');
              },
            ),
          ],
        ),
      ),
    );
  }
}
