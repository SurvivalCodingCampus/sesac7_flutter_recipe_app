import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/big_button.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/filter_button.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/rating_button.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/rating_dialog.dart';
import 'package:flutter_recipe_app/presentation/components/cards/ingredient_card.dart';
import 'package:flutter_recipe_app/presentation/components/cards/recipe_card.dart';
import 'package:flutter_recipe_app/presentation/components/input_fields/default_input_field.dart';
import 'package:flutter_recipe_app/presentation/components/tabs/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final tomatos = Ingredient(
    title: 'Tomatos',
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
    quantity: 500,
  );
  final Recipe recipe = Recipe(
    name: "Traditional spare ribs baked",
    imageUrl:
        "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
    chef: "Chef John",
    cookingTime: "20 min",
    rating: 4.0,
    onChangeFavorite: () {},
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 30),
              IngredientCard(ingredient: tomatos),
              RecipeCard(recipe: recipe),
              FilterButton(
                text: 'Local Dish',
                isSelected: true,
                toggleSelected: (selected) {
                  print(selected);
                },
              ),
              RatingButton(rating: 5, isSelected: false, toggleSelected: (selected) {
                print(selected);
              },),
              RatingDialog(
                title: 'Rate Recipe',
                actionName: 'Send',
                onPop: (int rating) {print(rating.toString());},
              ),
              RatingDialog(
                title: 'Rate Recipe',
                actionName: 'Send',
                onPop: (int rating) {print(rating.toString());},
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
