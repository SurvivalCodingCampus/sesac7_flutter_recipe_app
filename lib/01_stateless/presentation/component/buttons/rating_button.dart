import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
/*
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            RatingButton(text: '5', isSelected: true),
            RatingButton(text: '5', isSelected: false),
          ],
        )
      )
    )
  );
}
*/
class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const RatingButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected? Colors.white : AppColors.primary100,
        border: Border.all(
          width: 1,
          color: isSelected? AppColors.primary80 : AppColors.primary100,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.smallerTextRegular,
              color: isSelected? AppColors.primary80 : Colors.white,
            )
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            Icons.star,
            color: isSelected? AppColors.primary80: Colors.white),
        ],
      )
    );
  }
}
