import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(100),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 150, // Ensures text can wrap if the text is long
            child: Text(
              recipe.chef,
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray4,
              ),
            ),
          ),
          Positioned(
            bottom: 22,
            left: 10,
            right: 150, // Ensures text can wrap if the text is long
            child: Text(
              recipe.name,
              style: TextStyles.smallTextBold.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 13.5,
            right: 44,
            child: CookingTimeWidget(cookingTime: recipe.cookingTime),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.bookmark,
                size: 16,
                color: AppColors.primary80,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: RatingWidget(rating: recipe.rating),
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String name;
  final String imageUrl;
  final String chef;
  final String cookingTime;
  final double rating;
  final void Function() onChangeFavorite;

  const Recipe({
    required this.name,
    required this.imageUrl,
    required this.chef,
    required this.cookingTime,
    required this.rating,
    required this.onChangeFavorite,
  });
}

class CookingTimeWidget extends StatelessWidget {
  final String cookingTime;

  const CookingTimeWidget({
    required this.cookingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.timer_outlined,
            size: 17,
            color: AppColors.white,
          ),
          Text(
            cookingTime,
            style: TextStyles.smallerTextRegular.copyWith(
              color: AppColors.gray4,
            ),
          ),
        ],
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 16,
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.secondary20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star_rate,
            color: AppColors.rating,
            size: 8,
          ),
          SizedBox(width: 3,),
          SizedBox(width: 12, height: 12, child: Text('4.0', style: TextStyles.smallerTextRegular.copyWith(fontSize: 8),)),
        ],
      ),
    );
  }
}

// Widget buildCookingTime() {
//   return Container(
//     width: 60,
//     height: 24,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Icon(Icons.timelapse_rounded, size: 17, color: AppColors.white,),
//         Text(
//           '20 min',
//           style: TextStyles.smallerTextRegular.copyWith(
//             color: AppColors.gray4,
//           ),
//         ),
//       ],
//     ),
//   );
// }

void main() {
  final Recipe recipe = Recipe(name: "Traditional spare ribs baked", imageUrl: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg", chef: "Chef John", cookingTime: "20 min", rating: 4.0, onChangeFavorite: () {},);
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: RecipeCard(recipe: recipe),
          ),
        ),
      ),
    ),
  );
}
