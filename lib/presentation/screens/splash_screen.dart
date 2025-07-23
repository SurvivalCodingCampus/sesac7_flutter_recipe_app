import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/medium_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import '../../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  final VoidCallback onTapStartCooking;

  const SplashScreen({super.key, required this.onTapStartCooking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splash.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Column(
                children: [
                  Image.asset('assets/images/chef_image.png', width: 79,),
                  SizedBox(height: 10),
                  Text(
                    '100K+ Premium Recipe',
                    style: TextStyles.mediumTextBold.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(children: [
                Text('Get\nCooking', textAlign: TextAlign.center, style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600, color: AppColors.white,)),
                SizedBox(height: 20),
                Text('Simple way to find Tasty Recipe', style: TextStyles.normalTextRegular.copyWith(color: AppColors.white), )
              ],),
              SizedBox(height: 64),
              MediumButton(text: 'Start Cooking', onClick: onTapStartCooking),
              SizedBox(height: 84),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: SplashScreen(),
//     ),
//   );
// }
