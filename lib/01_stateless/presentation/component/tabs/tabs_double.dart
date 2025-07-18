import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class TabsDouble extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final Function(int index) onValueChange;

  const TabsDouble({super.key, required this.labels, required this.selectedIndex, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 30),
          Expanded(
            child: GestureDetector(
              onTap: () => onValueChange(0),
              child: SizedBox(
                height: 33,
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 0? AppColors.primary100 : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      labels[0],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextBold,
                        color: selectedIndex == 0? Colors.white : AppColors.primary80
                      )
                    )
                  ),
                )
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onTap: () => onValueChange(1),
              child: SizedBox(
                height: 33,
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == 1? AppColors.primary100 : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                            labels[1],
                            style: GoogleFonts.poppins(
                                textStyle: TextStyles.smallerTextBold,
                                color: selectedIndex == 1? Colors.white : AppColors.primary80
                            )
                        )
                    ),
                  )

              ),
            )
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
