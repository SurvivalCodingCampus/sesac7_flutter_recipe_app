import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/sns_login_button.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onSignInButtonClick;
  final VoidCallback onSignUpButtonClick;

  const SignInScreen({
    super.key,
    required this.onSignInButtonClick,
    required this.onSignUpButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Hello,',
                style: TextStyles.signInScreenTitle,
                maxLines: 1,
              ),
              Text(
                'Welcome Back!',
                style: TextStyles.signInScreenSubTitle,
                maxLines: 1,
              ),
              Spacer(),
              InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
                value: '',
                onValueChange: (value) {},
              ),
              SizedBox(
                height: 30.0,
              ),
              InputField(
                label: 'Enter Password',
                placeHolder: 'Enter Password',
                value: '',
                onValueChange: (value) {},
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.signInScreenForgotPassword,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              BigButton(
                title: 'Sign In',
                onClick: onSignInButtonClick,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 1.0,
                    color: AppColors.gray4,
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Text(
                    'Or Sign in With',
                    style: TextStyles.signInScreenOrSignInWith,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Container(
                    width: 50.0,
                    height: 1.0,
                    color: AppColors.gray4,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SnsLoginButton(
                    imageAssetPath: 'assets/icons8-google-240.png',
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  SnsLoginButton(
                    imageAssetPath: 'assets/facebook.png',
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: onSignUpButtonClick,
                  child: Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyles.signInScreenSignUpFirst,
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyles.signInScreenSignUpSecond,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 65.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
