import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash/splash.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(Icons.image_not_supported, size: 50),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(100),
                  Colors.black,
                ],
              ),
            ),
          ),
          Positioned(
            top: 104,
            left: 0,
            right: 0,
            child: Column(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.food_bank_outlined,
                  size: 79,
                  color: AppColors.white,
                ),
                Text(
                  '100K+ Premium Recipe',
                  style: TextStyles.mediumTextBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 84,
            left: 0,
            right: 0,
            child: Column(
              spacing: 64,
              children: [
                Column(
                  spacing: 20,
                  children: [
                    Text(
                      'Get\nCooking',
                      style: TextStyles.titleTextBold.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Simple way to find Tasty Recipe',
                      style: TextStyles.normalTextRegular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                MediumButton(text: 'Start Cooking', onClick: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
