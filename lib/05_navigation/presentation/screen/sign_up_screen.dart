import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/big_button.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/default_input_field.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless_widget/ui/text_styles.dart';
import 'package:flutter_recipe_app/05_navigation/presentation/component/social_sign_in_button.dart';

class SignUpScreen extends StatelessWidget {
  final String nameLabel = 'Name';
  final String namePlaceHolder = 'Enter Name';
  final String emailLabel = 'Email';
  final String emailPlaceHolder = 'Enter Email';
  final String passwordLabel = 'Password';
  final String passwordPlaceHolder = 'Enter Password';
  final String passwordConfirmLabel = 'Confirm Password';
  final String passwordConfirmPlaceHolder = 'Retype Password';
  final String acceptTerms = 'Accept Terms & Condition';
  final String buttonText = 'Sign in';
  final String orSignInWith = '─────── Or Sign in With ───────';
  final String alreadyAMember = 'Already a member?';
  final String signUp = ' Sign up';
  final String signIn = ' Sign in';

  final void Function() onSignUp;
  final void Function() onSignIn;

  final String title = 'Create an account';
  final String subtitle =
      'Let\'s help you set up your account,\nit won\'t take long.';

  const SignUpScreen({
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
            Expanded(flex: 54, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: TextStyles.largeTextBold),
                    SizedBox(height: 5),
                    Text(subtitle, style: TextStyles.smallerTextRegular),
                  ],
                ),
              ],
            ),
            Expanded(flex: 20, child: SizedBox()),
            DefaultInputField(
              label: nameLabel,
              placeHolder: namePlaceHolder,
              onValueChange: (value) {},
            ),
            Expanded(flex: 20, child: SizedBox()),
            DefaultInputField(
              label: emailLabel,
              placeHolder: emailPlaceHolder,
              onValueChange: (value) {},
            ),
            Expanded(flex: 20, child: SizedBox()),
            DefaultInputField(
              label: passwordLabel,
              placeHolder: passwordPlaceHolder,
              onValueChange: (value) {},
            ),
            Expanded(flex: 20, child: SizedBox()),
            DefaultInputField(
              label: passwordConfirmLabel,
              placeHolder: passwordConfirmPlaceHolder,
              onValueChange: (value) {},
            ),
            Expanded(flex: 20, child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 17,
                    height: 17,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.secondary100,
                        width: 1,
                      ),
                    ),
                  ),
                  Text(
                    acceptTerms,
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: AppColors.secondary100,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 26, child: SizedBox()),
            BigButton(
              text: signUp,
              onClick: onSignUp,
            ),
            Expanded(flex: 14, child: SizedBox()),
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
            Expanded(flex: 20, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  alreadyAMember,
                  style: TextStyles.smallerTextSemiBold,
                ),
                GestureDetector(
                  onTap: onSignIn,
                  child: Text(
                    signIn,
                    style: TextStyles.smallerTextSemiBold.copyWith(
                      color: AppColors.secondary100,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(flex: 30, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
