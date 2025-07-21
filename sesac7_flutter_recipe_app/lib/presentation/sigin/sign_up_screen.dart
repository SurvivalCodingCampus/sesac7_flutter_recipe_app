import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/sns_login_button.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                height: 10.0,
              ),
              Text(
                'Create an account',
                style: TextStyles.signUpScreenTitle,
                maxLines: 1,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Let\'s help you set up your account,\nit won\'t take long.',
                style: TextStyles.signUpScreenSubTitle,
                maxLines: 2,
              ),
              Spacer(),
              InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
                value: '',
                onValueChange: (value) {},
              ),
              Spacer(),
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
                onClick: () {},
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
              SizedBox(
                height: 55.0,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    context.go(Routes.signUp);
                  },
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
