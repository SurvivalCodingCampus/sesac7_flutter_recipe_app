import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/small_button.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: 
        Column(
          children: [
            RatingDialog(title: 'Rate recipe', buttonText: 'Send', onPress: (int i) {}),

          ],
        ),
      )
    )
  );
}

class RatingDialog extends StatefulWidget {

  final String title;
  final String buttonText;
  final void Function(int rate) onPress;

  const RatingDialog({super.key, required this.title, required this.buttonText, required this.onPress});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {

  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 91,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.smallerTextRegular,
              color: AppColors.labelColor,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    rating = 1;
                  });
                },
                child: Icon(
                  (rating >= 1)? Icons.star : Icons.star_border_outlined,
                  size: 20,
                  color: AppColors.rating,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    rating = 2;
                  });
                },
                child: Icon(
                  (rating >= 2)? Icons.star : Icons.star_border_outlined,
                  size: 20,
                  color: AppColors.rating,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    rating = 3;
                  });
                },
                child: Icon(
                  (rating >= 3)? Icons.star : Icons.star_border_outlined,
                  size: 20,
                  color: AppColors.rating,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    rating = 4;
                  });
                },
                child: Icon(
                  (rating >= 4)? Icons.star : Icons.star_border_outlined,
                  size: 20,
                  color: AppColors.rating,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    rating = 5;
                  });
                },
                child: Icon(
                  (rating >= 5)? Icons.star : Icons.star_border_outlined,
                  size: 20,
                  color: AppColors.rating,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SmallButton(
            width: 61,
            height: 20,
            color: AppColors.rating,
            text: 'Send',
            onClick: () => {
              if (rating != 0){
                widget.onPress(rating)
              }
            },
            isEnabled: (rating == 0)? false : true,
          )
        ],
      )
    );
  }
}
