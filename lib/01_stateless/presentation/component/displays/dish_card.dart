import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/bookmark_button.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';


/*
void main() {

  final Recipe recipe = Recipe(
    id: 0,
    name: "Traditional spare ribs baked",
    author: "Chef John",
    image: "https://placehold.co/600x400.jpg",
    duration: 20,
    rating: 4.0, categories: {},
  );

  runApp(
    MaterialApp(
      home: Scaffold(
        body: DishCard(
          recipe: recipe,
        )
      )
    )
  );
}

   */

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final bool isBookmarked;
  final void Function(int id) onBookmark;

  const DishCard({super.key, required this.recipe, required this.onBookmark, required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 231,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                color: AppColors.gray4,
                borderRadius: BorderRadius.circular(12),
              ),
            )
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style:
                    GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextRegular,
                      color: AppColors.gray3,
                    ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${recipe.duration} Mins',
                  style:
                    GoogleFonts.poppins(
                      textStyle: TextStyles.smallTextBold,
                      color: AppColors.gray1,
                    )
                ),
              ],
            )
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: BookmarkButton(size: 24, innerSize: 16, onClick: () {
              onBookmark(recipe.id);
            }, isAdded: isBookmarked,),
          ),
          Positioned(
            bottom: 68,
            left: 10,
            right: 10,
            child: Text(
              recipe.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: TextStyles.smallTextBold,
                color: AppColors.gray1,
              )
            )
          ),
          Positioned(
            top:0,
            left:0,
            right:0,
            child: Center(
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  image: DecorationImage(
                    image: NetworkImage(recipe.image),
                    fit: BoxFit.cover,
                  )
                ),
              )
            )
          ),
          Positioned(
            left: 105,
            top: 30,
            child:
            Container(
              width: 45,
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.secondary20,
              ),
              child: Center(
                child: Row(
                  children: [
                    const Spacer(),
                    Icon(Icons.star, color: AppColors.rating, size: 10),
                    const SizedBox(width: 4),
                    Text(
                      recipe.rating.toStringAsFixed(1),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextRegular,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          )
        ],
      )
    );
  }
}
