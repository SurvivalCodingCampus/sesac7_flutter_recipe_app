import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/input_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes.dart';
import 'sign_up_view_model.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpViewModel viewModel;

  const SignUpScreen({super.key, required this.viewModel});

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
                'Create an account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let's help you set up your account,\nit won't take long.",
                style: TextStyle(fontSize: 14, color: AppColors.gray2),
              ),
              const SizedBox(height: 32),

              InputField(
                label: 'Name',
                hint: 'Enter Name',
                controller: viewModel.nameController,
              ),
              const SizedBox(height: 20),

              InputField(
                label: 'Email',
                hint: 'Enter Email',
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
              ),
              const SizedBox(height: 20),

              InputField(
                label: 'Password',
                hint: 'Enter Password',
                obscureText: true,
                controller: viewModel.passwordController,
              ),
              const SizedBox(height: 20),

              InputField(
                label: 'Confirm Password',
                hint: 'Retype Password',
                obscureText: true,
                controller: viewModel.confirmPasswordController,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Checkbox(
                    value: viewModel.isTermsAccepted,
                    activeColor: AppColors.secondary100,
                    onChanged: viewModel.toggleTerms,
                  ),
                  const SizedBox(width: 4),
                  const Flexible(
                    child: Text(
                      'Accept terms & Condition',
                      style: TextStyle(
                        color: AppColors.secondary100,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),

              BigButton(
                text: 'Sign Up',
                isDisabled: !viewModel.isFormValid,
                onTap: viewModel.signUp,
              ),
              const SizedBox(height: 24),

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
                  const Text("Already a member? "),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.signIn);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: AppColors.secondary100),
                    ),
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
