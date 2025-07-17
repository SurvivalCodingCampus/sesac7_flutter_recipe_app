import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/text_styles.dart';


class SmallButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      height: 37,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.smallerTextBold,
              color: Colors.white,
            ),
          )
      ),
    );
  }
}
