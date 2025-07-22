import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../core/routing/router.dart';
import '../../core/routing/routes.dart';
import '../../ui/text_styles.dart';
import '../component/button/big_button.dart';
import '../component/input_field/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text('Hello,', style: TextStyles.headerTextBold.copyWith(color: AppColors.black)),
              Text('Welcome Back!', style: TextStyles.largeTextRegular.copyWith(color: AppColors.black)),
              const SizedBox(height: 47),

              /// Email Field
              InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
                value: '',
                onValueChange: (value) {
                  print(value);
                },
              ),

              const SizedBox(height: 20),

              InputField(
                label: 'Enter Password',
                placeHolder: 'Enter Password',
                value: '',
                onValueChange: (value) {
                  print(value);
                },
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.smallerTextRegular.copyWith(color: AppColors.secondary100),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Sign In Button
              BigButton(text: 'Sign In', onClick: (){
                router.go(Routes.main);
              }),

              const SizedBox(height: 20),

              /// Or sign in with
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Or Sign in With', style: TextStyles.smallerTextBold.copyWith(color: AppColors.gray4)),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 16),

              /// Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialIconButton('assets/icons/google.png', () {}),
                  const SizedBox(width: 10),
                  _socialIconButton('assets/icons/facebook.png', () {}),
                ],
              ),

              const SizedBox(height: 36),

              /// Bottom Text
              Center(
                child: GestureDetector(
                  onTap: () {
                    router.go(Routes.join);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyles.smallerTextBold.copyWith(color: AppColors.black),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyles.smallerTextBold.copyWith(color: AppColors.secondary100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget for social login button
  Widget _socialIconButton(String asset, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(asset, width: 44, height: 44),
    );
  }
}
