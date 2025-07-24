import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/card/ingredient_item.dart';
import 'package:flutter_recipe_app/presentation/component/inputfield/input_field.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tab.dart';

import '../../data/model/ingredient.dart';
import '../../data/model/ingredients.dart';
import '../component/button/small_button.dart';
import '../component/card/recipe_card.dart';
import '../component/card/ingredient_item.dart';

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
              RecipeCard(),
              SizedBox(height: 16),
              IngredientItem(
                ingredients: Ingredients(
                  amount: 500,
                  ingredient: Ingredient(
                    id: 1,
                    name: 'Tomato',
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
