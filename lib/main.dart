import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/category.dart';
import 'package:flutter_recipe_app/data/model/ingredient.dart';
import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/ingredient_item.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/recipe_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IngredientItem(
              ingredient: Ingredient(
                name: 'Tomatos',
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
                weight: 500,
              ),
            ),
            RecipeCard(
              recipe: Recipe(
                id: '1',
                name: 'Traditional spare ribs baked',
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
                imageWithBackgroundUrl: 'https://example.com/spaghetti_bg.jpg',
                rating: 4.0,
                cookingTime: Duration(minutes: 20),
                creator: 'Chef John',
                createdAt: DateTime.now(),
                videoUrl: 'https://example.com/spaghetti_video.mp4',
                ingredients: [],
                category: Category.dinner,
                tags: ['Italian', 'Dinner'],
                reviews: [],
                servings: 2,
                steps: [],
              ),
              onBookmarkTap: () {},
            ),
            Row(
              spacing: 10,
              children: [
                RatingButton(text: '5', isSelected: false, onTap: (value) {}),
                RatingButton(text: '5', isSelected: true, onTap: (value) {}),
                FilterButton(
                  text: 'Text',
                  isSelected: false,
                  onTap: (value) {},
                ),
                FilterButton(text: 'Text', isSelected: true, onTap: (value) {}),
              ],
            ),
            BigButton(text: 'text', onClick: () {}),
            RatingDialog(
              title: 'Rate recipe',
              actionName: 'Send',
              onChange: (rating) {},
            ),
          ],
        ),
      ),
    );
  }
}
