import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const MediumButton({super.key, required this.text, required this.onClick,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 243,
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 24,
                  child: Center(
                    child: Text(
                      text,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.normalTextBold,
                        color: Colors.white
                      )
                    ),
                  )
                ),
                const SizedBox(
                  width: 9,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.white
                ),
                const Spacer()
              ],)
        ),
      ),
    );
  }
}
