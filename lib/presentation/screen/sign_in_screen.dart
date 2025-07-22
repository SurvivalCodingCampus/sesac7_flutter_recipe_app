import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/big_button.dart';
import '../component/default_input_field.dart';
import '../component/social_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  final String headerText = 'Hello,';
  final String welcomeText = 'Welcome Back!';
  final String emailLabel = 'Email';
  final String emailPlaceHolder = 'Enter Email';
  final String passwordLabel = 'Enter Password';
  final String passwordPlaceHolder = 'Enter Password';
  final String forgotPassword = 'Forgot Password?';
  final String buttonText = 'Sign in';
  final String orSignInWith = '─────── Or Sign in With ───────';
  final String dontHaveAccount = 'Don\'t have an account?';
  final String signUp = ' Sign up';

  final void Function() onSignUp;
  final void Function() onSignIn;

  const SignInScreen({
    super.key,
    required this.onSignUp,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            Expanded(flex: 94, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(headerText, style: TextStyles.headerTextBold),
                    Text(welcomeText, style: TextStyles.largeTextRegular),
                  ],
                ),
              ],
            ),
            Expanded(flex: 57, child: SizedBox()),
            DefaultInputField(
              label: emailLabel,
              placeHolder: emailPlaceHolder,
              onValueChange: (value) {},
            ),
            Expanded(flex: 30, child: SizedBox()),
            DefaultInputField(
              label: passwordLabel,
              placeHolder: passwordPlaceHolder,
              onValueChange: (value) {},
            ),
            Expanded(flex: 20, child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    forgotPassword,
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: AppColors.secondary100,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 25, child: SizedBox()),
            BigButton(
              text: buttonText,
              onClick: onSignIn,
            ),
            Expanded(flex: 20, child: SizedBox()),
            Text(
              orSignInWith,
              style: TextStyles.smallerTextSemiBold.copyWith(
                color: AppColors.gray4,
              ),
            ),
            Expanded(flex: 20, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialSignInButton(
                  icon: Icon(
                    Icons.g_mobiledata_rounded,
                    size: 32,
                  ),
                ),
                SocialSignInButton(
                  icon: Icon(
                    Icons.facebook,
                    color: Color(0xFF3B5988),
                    size: 24,
                  ),
                ),
              ],
            ),
            Expanded(flex: 55, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dontHaveAccount,
                  style: TextStyles.smallerTextSemiBold,
                ),
                GestureDetector(
                  onTap: onSignUp,
                  child: Text(
                    signUp,
                    style: TextStyles.smallerTextSemiBold.copyWith(
                      color: AppColors.secondary100,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(flex: 99, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
