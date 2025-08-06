import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body:
//           Column(
//             children: [
//               FilterButton(text: 'All', isSelected: true),
//               FilterButton(text: 'Newest', isSelected: false)
//             ],
//           )
//       ),
//     )
//   );
// }

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;

  const FilterButton({super.key, required this.text, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 27,
        decoration: BoxDecoration(
          color: !isSelected? Colors.white : AppColors.primary100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: !isSelected? AppColors.primary80 : AppColors.primary100,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
           text,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.smallerTextRegular,
              color: !isSelected? AppColors.primary80 : Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
