import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final Function(String) onValueChange;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 81,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyles.smallTextRegular,
              color: AppColors.labelColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 55,
            child: TextField(
                onChanged: (value) {
                  onValueChange(value);
                },
                decoration: InputDecoration(
                  hintText: placeHolder,
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextRegular,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray4
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.gray4,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primary80,
                        width: 1.5,
                      )
                  ),
                ),
                style: GoogleFonts.poppins(
                  textStyle: TextStyles.smallerTextRegular,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )
            ),
          ),
        ],
      ),
    );
  }
}
