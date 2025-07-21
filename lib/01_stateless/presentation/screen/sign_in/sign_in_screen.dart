import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/big_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/inputs/input_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

void main() {
  runApp(MaterialApp(home: SignInScreen()));
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.headerTextBold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.largeTextRegular,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 57),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputField(
              label: 'Email',
              placeHolder: 'Enter Email',
              value: '',
              onValueChange: (String s) {},
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputField(
              label: 'Enter Password',
              placeHolder: 'Enter Password',
              value: '',
              onValueChange: (String s) {},
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.poppins(
                textStyle: TextStyles.smallerTextRegular,
                color: AppColors.secondary100,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BigButton(text: 'Sign In', onClick: () {}),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              Text(
                'Or Sign In With',
                style: GoogleFonts.poppins(
                  textStyle: TextStyles.smallerTextSemibold,
                  color: AppColors.gray4,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              const SizedBox(
                width: 44,
                height: 44,
              ),
              const SizedBox(width: 25),
              const SizedBox(
                width: 44,
                height: 44,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 55),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextSemibold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' Sign up',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextSemibold,
                        color: AppColors.secondary100,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
