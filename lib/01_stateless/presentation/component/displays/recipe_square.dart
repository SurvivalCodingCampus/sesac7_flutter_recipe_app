import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final Recipe recipe = Recipe(
      name: "Traditional spare ribs baked",
      author: "Chef John",
      image:  "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0
  );
  runApp(
      MaterialApp(
          home: Scaffold(
              body: SizedBox(
                width: 150,
                height: 150,
                child:
                  RecipeSquare(recipe: recipe)
                ,
              )
          )
      )
  );
}

class RecipeSquare extends StatelessWidget {

  final Recipe recipe;

  const RecipeSquare({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(recipe.image, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 37,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.secondary20,
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Spacer(),
                      Icon(Icons.star, color: AppColors.rating, size: 7),
                      const SizedBox(width: 3),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyles.smallerTextSmallLabel,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),

                    ],
                  ),
                ),
              ),
            ),
            Positioned  (
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextBold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 3),
                  Text(
                      'By ${recipe.author}',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextSmallLabel,
                        color: AppColors.gray3,
                      )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
