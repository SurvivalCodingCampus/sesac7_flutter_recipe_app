import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/component/button/big_button.dart';
import 'package:flutter_recipe_app/component/button/filter_button.dart';
import 'package:flutter_recipe_app/component/button/rating_button.dart';
import 'package:flutter_recipe_app/component/button/small_button.dart';
import 'package:flutter_recipe_app/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/component/widget/ingredient_item.dart';
import 'package:flutter_recipe_app/component/widget/recipe_thumbnail.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigButton(
                buttonText: 'Button',
                onTap: () {
                  print('Big Button');
                },
              ),
              const SizedBox(height: 10),
              IngredientItem(onTap: () => print('ingredient Item')),
              const SizedBox(height: 10),
              RecipeThumbnail(
                userName: 'Chef John',
                firstLine: 'Traditional spare ribs',
                secondLine: 'baked',
                rating: 4.0,
                minutes: 20,
                onTapList: () => print('Recipe Thumbnail'),
                onTapBookmark: () => print('Bookmark'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  RatingButton(rating: 5, onTap: () => print('Rating Button')),
                  const SizedBox(width: 5),
                  FilterButton(onTap: () => print('Filter Button')),
                ],
              ),
              const SizedBox(height: 10),
              SmallButton(
                buttonText: 'Rating',
                onTap: () => showRatingDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showRatingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RatingDialog(
        onRatingChanged: (rating) {
          print('rating : $rating');
        },
      );
    },
  );
}
