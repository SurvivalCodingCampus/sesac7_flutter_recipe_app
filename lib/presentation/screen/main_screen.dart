import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipes.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_item.dart';
import 'package:flutter_recipe_app/presentation/component/inputfield/input_field.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tab.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_screen/saved_recipes_screen.dart';

import '../../data/model/ingredients.dart';
import '../component/button/small_button.dart';
import '../component/card/recipe_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigButton(
                text: 'Button',
                onClick: (value) {},
              ),
              SizedBox(height: 16),
              MediumButton(
                text: 'Button',
                onClick: (String text) {},
              ),
              SizedBox(height: 16),
              SmallButton(
                text: 'Button',
                onClick: (String text) {},
              ),
              SizedBox(height: 16),
              InputField(
                label: 'Label',
                placeHolder: 'Placeholder',
                value: 'Value',
                onValueChange: (String value) {
                  print(value);
                },
              ),
              SizedBox(height: 16),
              Tap(
                labelList: ['Label1', 'Label2'],
                selectedIndex: 0,
                onValueChange: (int index) {
                  print(index);
                },
              ),
              SizedBox(height: 16),
              RecipeCard(
                onBookmarkPressed: () {
                  print('Bookmark pressed');
                },
                recipe: Recipes(
                  category: 'category',
                  id: 1,
                  name: 'Traditional spare ribs baked',
                  image:
                      'https://cdn.pixabay.com/photo/2019/10/22/10/11/beef-wellington-4568239_1280.jpg',
                  chef: 'By Chef John',
                  time: '30min',
                  rating: 4.5,
                ),
              ),
              SizedBox(height: 16),
              IngredientItem(
                ingredients: Ingredients(id: 1, name: 'Tomato', image: 'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
                  ),
                ),
              SizedBox(height: 16),
              Row(
                children: [
                  RatingButton(
                    text: '5',
                    isSelected: true,
                    onTap: () {
                      print('Rating button');
                    },
                  ),
                  SizedBox(width: 16),
                  FilterButton(
                    text: 'Text',
                    isSelected: true,
                    onTap: () {
                      print('Text button');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
