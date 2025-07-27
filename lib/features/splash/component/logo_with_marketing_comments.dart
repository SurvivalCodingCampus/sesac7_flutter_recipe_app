import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class LogoWithMarketingComments extends StatelessWidget {
  const LogoWithMarketingComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 209,
      height: 120,
      margin: EdgeInsets.fromLTRB(83, 0, 83, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/splash_screen_logo.png'),
            width: 79,
            height: 79,
          ),
          const Spacer(flex: 14),
          Text(
            '100K+ Premium Recipe',
            style: TextStyles.mediumTextBold.copyWith(
              color: AppColors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
