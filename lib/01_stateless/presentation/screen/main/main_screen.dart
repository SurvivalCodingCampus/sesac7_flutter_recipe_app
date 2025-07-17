import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/recipe_card.dart';
import '../../../data/model/ingredient.dart';
import '../../component/ingredient_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IngredientItem(
              ingredient: Ingredient(
                name: 'Tomatos',
                image:
                    'https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg',
              ),
              amount: '500g',
            ),
            RecipeCard(
              recipe: Recipe(
                name: 'galbijjim',
                author: 'sumin',
                image: 'https://placehold.co/600x400.jpg',
                duration: 60,
                rating: 5.0,
              ),
              onTap: () => print("hello")
            ),
          ],
        ),
      ),
    );
  }
}
