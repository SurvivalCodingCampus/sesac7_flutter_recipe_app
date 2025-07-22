import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../core/routing/router.dart';
import '../../core/routing/routes.dart';
import '../../ui/text_styles.dart';
import '../component/button/big_button.dart';
import '../component/input_field/input_field.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

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
              Text(
                'Create an account,',
                style: TextStyles.largeTextBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                'Let’s help you set up your account,\nit won’t take long.',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 15),

              InputField(
                label: 'Name',
                placeHolder: 'Enter Name',
                value: '',
                onValueChange: (value) {
                  print(value);
                },
              ),

              const SizedBox(height: 15),

              InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
                value: '',
                onValueChange: (value) {
                  print(value);
                },
              ),

              const SizedBox(height: 15),

              InputField(
                label: 'Enter Password',
                placeHolder: 'Enter Password',
                value: '',
                onValueChange: (value) {
                  print(value);
                },
              ),

              const SizedBox(height: 15),

              InputField(
                label: 'Confirm Password',
                placeHolder: 'Retype Password',
                value: '',
                onValueChange: (value) {
                  print(value);
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                      value: false,
                      onChanged: (value) {
                        //setState(() => isChecked = value!);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: AppColors.secondary100,
                      side: const BorderSide(
                        color: AppColors.secondary100,
                        width: 2,
                      ), // 테두리 색
                    ),
                  ),
                  Text(
                    'Accept terms & Condition',
                    style: TextStyles.smallerTextRegular.copyWith(color: AppColors.secondary100),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Sign In Button
              BigButton(
                text: 'Sign In',
                onClick: () {
                  router.go(Routes.main);
                },
              ),

              const SizedBox(height: 20),

              /// Or sign in with
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Or Sign in With',
                      style: TextStyles.smallerTextBold.copyWith(
                        color: AppColors.gray4,
                      ),
                    ),
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

              const SizedBox(height: 18),

              /// Bottom Text
              Center(
                child: GestureDetector(
                  onTap: () {
                    router.go(Routes.login);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Already a member? ",
                      style: TextStyles.smallerTextBold.copyWith(
                        color: AppColors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyles.smallerTextBold.copyWith(
                            color: AppColors.secondary100,
                          ),
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
