import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/inputfield/input_field.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30.0),
              // "Hello, Welcome Back!" 섹션
              const Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Let\'s help you set up your account,\nit won\'t take long.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              InputField(
                label: 'Name',
                placeHolder: 'Enter Name',
                value: '',
                onValueChange: (String value) {},
                width: double.infinity,
              ),
              const SizedBox(height: 20.0),
              InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
                value: '',
                onValueChange: (String value) {},
                width: double.infinity,
              ),
              const SizedBox(height: 20.0),
              InputField(
                label: 'Password',
                placeHolder: 'Enter Password',
                value: '',
                onValueChange: (String value) {},
                width: double.infinity,
              ),
              const SizedBox(height: 20.0),
              InputField(
                label: 'Confirm Password',
                placeHolder: 'Retype Password',
                value: '',
                onValueChange: (String value) {},
                width: double.infinity,
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    Text('Accept & conditions'),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // "Forgot Password?" 로직
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              BigButton(
                text: 'Sign In',
                onClick: (String) {},
              ),
              const SizedBox(height: 32.0),

              // "Or Sign in With" 섹션
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or Sign in With',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialLoginButton('assets/images/google_logo.png'),
                  const SizedBox(width: 16.0),
                  _socialLoginButton('assets/images/facebook_logo.png'),
                ],
              ),
              const SizedBox(height: 48.0),

              // "Don't have an account?" 섹션
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.signInScreen);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 소셜 로그인 버튼을 위한 헬퍼 위젯
  Widget _socialLoginButton(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Image.asset(imagePath),
    );
  }
}
