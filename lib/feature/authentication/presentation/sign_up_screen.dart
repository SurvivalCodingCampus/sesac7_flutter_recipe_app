import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/oauth_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/input/input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  static const Key signInButtonKey = Key('SignUpScreen sign in button key');

  final VoidCallback onSignInTap;

  const SignUpScreen({
    super.key,
    required this.onSignInTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              children: [
                Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create an account',
                          style: TextStyles.largeTextBold,
                        ),
                        Text(
                          'Let\'s help you set up your account,\nit won\'t take long.',
                          style: TextStyles.smallerTextRegular,
                        ),
                      ],
                    ),
                    InputField(
                      label: 'Name',
                      placeholder: 'Enter Name',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Email',
                      placeholder: 'Enter Email',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Password',
                      placeholder: 'Enter password',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Confirm Password',
                      placeholder: 'Retype Password',
                      onValueChange: (value) {},
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 26),
                  child: Row(
                    spacing: 5,
                    children: [
                      Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.secondary100,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {},
                        child: Text(
                          'Accept terms & Condition',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.secondary100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BigButton(text: 'Sign Up', onClick: () {}),
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 20),
                  child: Row(
                    spacing: 7,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 1,
                        color: AppColors.gray4,
                      ),
                      Text(
                        'Or Sign In with',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.gray4,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 1,
                        color: AppColors.gray4,
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 25,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OAuthButton(
                      imageAssetPath: 'assets/images/icon/google.png',
                      onTap: () {},
                    ),
                    OAuthButton(
                      imageAssetPath: 'assets/images/icon/facebook.png',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member? ',
                      style: TextStyles.smallerTextRegular.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      key: signInButtonKey,
                      onTap: onSignInTap,
                      child: Text(
                        'Sign In',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.secondary100,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
