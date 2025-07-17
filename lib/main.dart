import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/component/button/big_button.dart';
import 'package:flutter_recipe_app/component/button/filter_button.dart';
import 'package:flutter_recipe_app/component/button/rating_button.dart';
import 'package:flutter_recipe_app/component/button/small_button.dart';
import 'package:flutter_recipe_app/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/component/widget/ingredient_item.dart';
import 'package:flutter_recipe_app/component/widget/recipe_thumbnail.dart';
import 'package:flutter_recipe_app/screen/home/splash_screen.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';
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
      appBar: AppBar(
        backgroundColor: AppColor.White,
        title: const Text(
          'Saved recipes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
