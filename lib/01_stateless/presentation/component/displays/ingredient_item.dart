import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/ingredient.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              ingredient.image,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            height: 24,
            child: Center(
              child: Text(
                ingredient.name,
                style: GoogleFonts.poppins(
                  textStyle: TextStyles.normalTextBold,
                  color: Color.fromRGBO(12, 12, 12, 1),
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 21,
            child: Center(
              child: Text(
                '${ingredient.amount}g',
                style: GoogleFonts.poppins(
                  textStyle: TextStyles.smallTextRegular,
                  color: AppColors.gray3,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
