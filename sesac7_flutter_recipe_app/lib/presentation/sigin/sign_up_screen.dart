import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/sns_login_button.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  final VoidCallback onSignUpButtonClick;
  final VoidCallback onSignInButtonClick;

  const SignUpScreen({
    super.key,
    required this.onSignUpButtonClick,
    required this.onSignInButtonClick,
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
                label: 'Name',
                placeHolder: 'Enter Name',
                value: '',
                onValueChange: (value) {},
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
                label: 'Password',
                placeHolder: 'Enter Password',
                value: '',
                onValueChange: (value) {},
              ),
              Spacer(),
              InputField(
                label: 'Confirm Password',
                placeHolder: 'Retype Password',
                value: '',
                onValueChange: (value) {},
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 17.0,
                        height: 17.0,
                        child: Checkbox(
                          side: BorderSide(
                            width: 1.0,
                            color: AppColors.secondary100,
                          ),
                          activeColor: Colors.white,
                          value: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5.0),
                          ),
                          checkColor: AppColors.secondary100,
                          onChanged: (isChecked) {},
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Accept Terms & Condition',
                        style: TextStyles.signInScreenForgotPassword,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              BigButton(
                title: 'Sign Up',
                onClick: onSignUpButtonClick,
              ),
              SizedBox(
                height: 14.0,
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
              Spacer(),
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
                  onTap: onSignInButtonClick,
                  child: Text.rich(
                    TextSpan(
                      text: 'Already a member? ',
                      style: TextStyles.signInScreenSignUpFirst,
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyles.signInScreenSignUpSecond,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
