import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/ingredient.dart';
import 'package:flutter_recipe_app/presentation/component/list_item/ingredient_item.dart';

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
          ],
        ),
      ),
    );
  }
}
