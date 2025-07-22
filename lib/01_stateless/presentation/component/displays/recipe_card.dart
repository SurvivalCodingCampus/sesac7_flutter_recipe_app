import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/recipe.dart';

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
        body: Column(
          children: [
            RecipeCard(recipe: recipe, onTap: (){})
          ],
        )
      )
    )
  );
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function() onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
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
          Positioned(
            left: 10,
            bottom: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
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
                      Text(
                        'By ${recipe.author}',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyles.smallerTextSmallLabel,
                          color: AppColors.gray4,
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 24,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 17,
                        height: 17,
                        child: Icon(
                          Icons.timer_outlined,
                          size: 17,
                          color: AppColors.gray4,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${recipe.duration} min',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyles.smallerTextRegular,
                          color: AppColors.gray4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.bookmark_border_outlined,
                        size: 16,
                        color: AppColors.primary80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
