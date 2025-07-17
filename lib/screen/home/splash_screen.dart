import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/component/button/medium_button.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/splash_logo.png',
                    width: 79,
                    height: 79,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                  SizedBox(height: 14),
                  Text(
                    '100K+ Premium Recipe',
                    style: TextStyle(
                      color: AppColor.White,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Get',
                    style: TextStyle(
                      color: AppColor.White,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'Cooking',
                    style: TextStyle(
                      color: AppColor.White,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Simple way to find Tasty Recipe',
                    style: TextStyle(color: AppColor.White, fontSize: 14),
                  ),
                  SizedBox(height: 64,),
                  MediumButton(buttonText: 'Start Cooking', onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
