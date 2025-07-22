import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';

class SplashScreenMainMarketingComments extends StatelessWidget {
  const SplashScreenMainMarketingComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 164,
      margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Get Cooking',
            textAlign: TextAlign.center,
            style: TextStyles.titleTextBold.copyWith(
              color: AppColors.white,
              fontSize: 49,
              height: 1.3,
            ),
          ),
          const Spacer(flex: 20),
          Text(
            'Simple way to find Tasty Recipe',
            textAlign: TextAlign.center,
            style: TextStyles.normalTextRegular.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
