import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/big_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/inputs/input_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

/*
void main() {
  runApp(MaterialApp(home: SignUpScreen()));
}
*/
class SignUpScreen extends StatelessWidget {

  final void Function() signInButtonOnTap;
  final void Function() signUpButtonOnTap;

  const SignUpScreen({super.key, required this.signInButtonOnTap, required this.signUpButtonOnTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 69,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an Account',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.largeTextBold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Let\'s help you set up your account,\nit won\'t take long.',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextRegular,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputField(
              label: 'Name',
              placeHolder: 'Enter Name',
              value: '',
              onValueChange: (String s) {},
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputField(
              label: 'Email',
              placeHolder: 'Enter Email',
              value: '',
              onValueChange: (String s) {},
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputField(
              label: 'Password',
              placeHolder: 'Enter Password',
              value: '',
              onValueChange: (String s) {},
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputField(
              label: 'Confirm Password',
              placeHolder: 'Retype Password',
              value: '',
              onValueChange: (String s) {},
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.secondary100, width: 1,),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Accept terms & Condition',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyles.smallerTextRegular,
                      color: AppColors.secondary100,
                    ),
                  )
                ],
              ),
            )
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BigButton(text: 'Sign Up', onClick: signUpButtonOnTap),
          ),
          const SizedBox(height: 14),
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
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 25),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: signInButtonOnTap,
                child: Row(
                  children: [
                    Text(
                      'Already a member?',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextSemibold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' Sign In',
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
