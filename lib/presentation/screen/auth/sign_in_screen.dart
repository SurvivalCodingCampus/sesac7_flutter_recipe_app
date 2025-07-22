import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/label_text_input.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';
import 'package:go_router/go_router.dart';

import '../../component/button/asset_logo_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                ],
              ),
              Container(
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelTextInput(
                      labelText: 'Email',
                      placeholderText: 'Enter Email',
                      onChanged: (value) {},
                    ),
                    LabelTextInput(
                      isPassword: true,
                      labelText: 'Enter Password',
                      placeholderText: 'Enter Password',
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: AppColor.Secondary100),
                      ),
                    ),
                    SizedBox(height: 25),
                    BigButton(
                      buttonText: 'sign in',
                      onTap: () {
                        context.go('/home');
                      },
                    ),
                  ],
                ),
              ),
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
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AssetLogoButton(imageUrl: 'assets/images/google_icon.png'),
                      SizedBox(width: 25),
                      AssetLogoButton(imageUrl: 'assets/images/facebook_icon.png'),
                    ],
                  ),
                  SizedBox(height: 55),
                  GestureDetector(
                    onTap: (){
                      context.push('/sign-up');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?', style: TextStyle(fontSize: 11)),
                        SizedBox(width: 4),
                        Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 11, color: AppColor.Secondary100),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
