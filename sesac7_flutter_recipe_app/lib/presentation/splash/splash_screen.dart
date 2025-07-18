import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_screen_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60.0,
              left: 83.0,
              right: 83.0,
              child: SizedBox(
                width: 209.0,
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/splash_app_logo.png',
                      width: 79.0,
                      height: 79.0,
                    ),
                    Spacer(),
                    Text(
                      '100K+ Premium Recipe',
                      style: TextStyles.splashScreenLogoTitle,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 50.0,
              right: 50.0,
              child: SizedBox(
                width: 275.0,
                height: 393.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 213.0,
                      height: 120.0,
                      child: Text(
                        'Get Cooking',
                        style: TextStyles.splashScreenLogoSubtitle,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Simple way to find Tasty Recipe',
                        style: TextStyles.splashScreenLogoTitle,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 64.0,
                    ),
                    MediumButton(
                      title: 'Start Cooking',
                      onClick: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
