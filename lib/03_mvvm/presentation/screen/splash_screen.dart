import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/medium_button.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/component/logo_with_marketing_comments.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/component/splash_screen_main_marketing_comments.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/splash_screen_background.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.4),
                      AppColors.black.withValues(alpha: 1.0),
                    ],
                    stops: [0.3, 1.0],
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  LogoWithMarketingComments(),

                  // SizedBox(height: 222),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0,
                        maxHeight: 222,
                      ),
                      child: SizedBox(height: 222),
                    ),
                  ),
                  SplashScreenMainMarketingComments(),

                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0,
                        maxHeight: 64,
                      ),
                      child: SizedBox(height: 64),
                    ),
                  ),
                  // SizedBox(height: 64),
                  MediumButton(text: 'Start Cooking', onClick: () {}),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
