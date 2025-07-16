import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/component/button/big_button.dart';
import 'package:flutter_recipe_app/component/button/medium_button.dart';
import 'package:flutter_recipe_app/component/button/small_button.dart';
import 'package:flutter_recipe_app/component/input/text_input.dart';
import 'package:flutter_recipe_app/component/tabs/custom_tab.dart';
import 'package:flutter_recipe_app/component/widget/ingredient_item.dart';
import 'package:flutter_recipe_app/component/widget/recipe_thumbnail.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const tab1 = [
    {'id': 1, 'name': 'Label'},
    {'id': 2, 'name': 'Label'},
  ];

  static const tab2 = [
    {'id': 1, 'name': 'Label'},
    {'id': 2, 'name': 'Label'},
    {'id': 3, 'name': 'Label'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigButton(
                  buttonText: 'Button',
                  onTap: () {
                    print('Big Button');
                  },
                ),
                SizedBox(height: 10),
                RecipeThumbnail(),
                SizedBox(height: 5),
                IngredientItem()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
