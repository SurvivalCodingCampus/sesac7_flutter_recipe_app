import 'package:flutter/material.dart';

import '../../../../core/presentation/component/medium_button.dart';
import '../../../../ui/app_colors.dart';
import '../../component/logo_with_marketing_comments.dart';
import '../../component/splash_screen_main_marketing_comments.dart';

class SplashScreen extends StatelessWidget {
  final void Function() onStart;

  const SplashScreen({
    super.key,
    required this.onStart,
  });

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
                  MediumButton(
                    text: 'Start Cooking',
                    onClick: onStart,
                  ),
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
