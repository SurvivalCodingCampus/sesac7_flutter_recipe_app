import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/asset_logo_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/label_text_input.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Let\'s help you set up your account,\nit wont\'t take long.',
                    style: TextStyle(fontSize: 11, height: 1.5),
                  ),
                ],
              ),
              LabelTextInput(
                labelText: 'Name',
                placeholderText: 'Enter Name',
                onChanged: (value) {},
              ),
              LabelTextInput(
                labelText: 'Email',
                placeholderText: 'Enter Email',
                onChanged: (value) {},
              ),
              LabelTextInput(
                isPassword: true,
                labelText: 'Password',
                placeholderText: 'Enter Password',
                onChanged: (value) {},
              ),
              LabelTextInput(
                isPassword: true,
                labelText: 'Confirm Password',
                placeholderText: 'Retype Password',
                onChanged: (value) {},
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                      checkColor: Colors.white,
                      activeColor: AppColor.Secondary100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Accept terms & Condition',
                    style: TextStyle(
                      color: AppColor.Secondary100,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              BigButton(buttonText: 'Sign Up', onTap: () {
                context.go('/home');
              }),
              Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColor.Gray4,
                          thickness: 1,
                          indent: 50,
                          endIndent: 10,
                        ),
                      ),
                      const Text(
                        'Or Sign in With',
                        style: TextStyle(color: AppColor.Gray4, fontSize: 11),
                      ),
                      const Expanded(
                        child: Divider(
                          color: AppColor.Gray4,
                          thickness: 1,
                          indent: 10,
                          endIndent: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AssetLogoButton(
                        imageUrl: 'assets/images/google_icon.png',
                      ),
                      SizedBox(width: 25),
                      AssetLogoButton(
                        imageUrl: 'assets/images/facebook_icon.png',
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?', style: TextStyle(fontSize: 11)),
                    SizedBox(width: 4),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColor.Secondary100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
