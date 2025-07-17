import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful/model/ingredient.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/component/bookmark_button_widget.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/component/ingredient_item_widget.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/component/recipe_list_item_widget.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/component/start_rate_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IngredientItem Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('테스트'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RecipeListItem(
                name: 'Traditonal spare ribs baked',
                userName: 'By ChefJohn',
                time: 20,
                rate: 4,
                width: 250,
                imgSrc: 'assets/images/recipe_list_item_thumbnail_1.png',
                isBookmarked: true,
                onClick: () {},
              ),
              SizedBox(height: 5),
              RecipeListItem(
                name: 'Traditonal spare ribs baked',
                userName: 'By ChefJohn',
                time: 20,
                rate: 4,
                width: 315,
                imgSrc: 'assets/images/recipe_list_item_thumbnail_1.png',
                isBookmarked: true,
                onClick: () {},
              ),
              SizedBox(height: 5),
              RecipeListItem(
                name: 'spice roasted chicken with flavored rice',
                userName: 'By ChefJohn',
                time: 20,
                rate: 4,
                imgSrc: 'assets/images/recipe_list_item_thumbnail_2.png',
                isBookmarked: true,
                onClick: () {},
              ),
              SizedBox(height: 5),
              StarRateWidget(rating: 0),
              SizedBox(height: 5),
              BookmarkButtonWidget(isBookmarked: false, onClick: () {}),
              IngredientItemWidget(
                width: 315,
                ingredient: Ingredient(
                  name: 'tomato',
                  quantity: 500,
                  imgSrc: 'assets/images/tomato.png',
                ),
              ),
              SizedBox(height: 5),
              IngredientItemWidget(
                ingredient: Ingredient(
                  name: 'tomato',
                  quantity: 500,
                  imgSrc: 'assets/images/tomato.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
