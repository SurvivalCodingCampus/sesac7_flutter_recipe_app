import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ui/text_styles.dart';

class MainBody extends StatelessWidget {
  final String userId;

  const MainBody({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 44),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello $userId',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.largeTextBold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'What are you cooking today?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextRegular,
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 40,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondary40,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer()
      ],
    );
  }
}
