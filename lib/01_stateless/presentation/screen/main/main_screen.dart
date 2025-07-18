import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/big_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/medium_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/inputs/input_field.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/small_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/tabs/tabs_double.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/tabs/tabs_triple.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            /*
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
            */
            SmallButton(text: "Button", onClick: (){} ),
            MediumButton(text: "Button", onClick: (){}),
            BigButton(text: "Button", onClick: (){}),
            TabsDouble(labels: ["0", "1"], selectedIndex: 1, onValueChange: (int a) {print(a); },),
            InputField(label: "Label", placeHolder: "placeholder", value: "", onValueChange: (s) {
              print(s);
            },),
            TabsTriple(labels: ["0", "1", "2"], selectedIndex: 2, onValueChange: (int b) {print(b);}),
          ],
        ),
      ),
    );
  }
}
