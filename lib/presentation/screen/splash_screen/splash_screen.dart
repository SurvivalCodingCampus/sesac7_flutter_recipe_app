import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/screen/splash_screen/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  // final SplashScreenViewModel viewModel;

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 60),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/asset/splash_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('lib/asset/ic_hat.png', width: 79, height: 79),
                  const SizedBox(height: 14),
                  Text(
                    '100K+ Premium Recipe',
                    style: AppTextStyles.mediumBold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'Get\nCooking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 50,
                      height: 1.2,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Simple way to find Tasty Recipe',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.normalRegular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 64),
                  BigButton(
                    text: 'Start Cooking',
                    onTap: () {
                      context.go(Routes.signIn);
                    },
                    isDisabled: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
