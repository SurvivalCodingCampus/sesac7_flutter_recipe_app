import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import '../../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/vegi.png',
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
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(children: [
                Text('Get\nCooking', textAlign: TextAlign.center, style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600, color: AppColors.gray3,)),
                SizedBox(height: 20),
                Text('Simple way to find Tasty Recipe', style: TextStyles.normalTextRegular.copyWith(color: AppColors.gray3), )
              ],),
              SizedBox(height: 64),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  fixedSize: Size(243, 54),
                  backgroundColor: AppColors.primary100,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Start Cooking', style: TextStyles.normalTextBold.copyWith(color: AppColors.white)),
                    SizedBox(width: 9),
                    Icon(Icons.arrow_forward_outlined, color: AppColors.white, size: 20,),
                  ],
                ),
              ),
              SizedBox(height: 84),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
    ),
  );
}
