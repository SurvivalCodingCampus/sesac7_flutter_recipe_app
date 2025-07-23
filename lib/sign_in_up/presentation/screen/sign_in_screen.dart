import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/sign_in_up/domain/model/sign_in_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../../core/presentation/component/button/big_button.dart';
import '../../../core/presentation/component/input/input_field.dart';

class SignInScreen extends StatelessWidget {
  final SignInViewModel viewModel;

  const SignInScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Hello,',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.gray2,
                ),
              ),
              const SizedBox(height: 57),

              InputField(
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
              ),
              const SizedBox(height: 30),

              InputField(
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
                controller: viewModel.passwordController,
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.secondary80),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              BigButton(
                text: 'Sign In',
                isDisabled: false,
                onTap: () {
                  viewModel.signIn();
                  context.go(Routes.home);
                },
              ),
              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: Divider(color: AppColors.gray4)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or Sign in With',
                      style: TextStyle(color: AppColors.gray2),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.gray4)),
                ],
              ),
              const SizedBox(height: 20),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.signUp);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: AppColors.secondary100),
                    )
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
