import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/medium_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/text_styles.dart';


void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
    )
  );
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Get\nCooking',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.titleTextBold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Simple way to find Tasty Recipe',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.normalTextRegular,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            child: Center(
              child: MediumButton(text: 'Start Cooking', onClick: () {
                print('hi');
              }),
            )
          )
        ],
      )
    );
  }
}
