import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/ingredient_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/recipe_card_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      home: const RecipeCardScreen(),
    );
  }
}