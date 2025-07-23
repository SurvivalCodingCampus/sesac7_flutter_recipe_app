import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/big_button.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/sns_auth_button.dart';
import 'package:flutter_recipe_app/presentation/components/input_fields/auth_form_field.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  const SignInScreen({super.key, required this.onTapSignIn, required this.onTapSignUp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyles.headerTextBold,
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyles.largeTextRegular,
                    ),
                    SizedBox(height: 20),
                    AuthFormField(
                      label: 'Email',
                      placeHolder: 'Enter Email',
                      onValueChange: (value) {},
                    ),
                    SizedBox(height: 20),
                    AuthFormField(
                      label: 'Password',
                      placeHolder: 'Enter Password',
                      onValueChange: (value) {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(height: 26),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: AppColors.secondary100,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BigButton(text: 'Sign In', onClick: () => onTapSignIn()),
                SizedBox(height: 25),
                Row(
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SnsAuthButton(
                      imageAssetPath: 'assets/images/google.png',
                      onTap: () {},
                    ),
                    SizedBox(width: 25),
                    SnsAuthButton(
                      imageAssetPath: 'assets/images/facebook.png',
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyles.smallerTextRegular.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: onTapSignUp,
                      child: Text(
                        'Sign Up',
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

// void main() {
//   // final Recipe recipe = Recipe(name: "Traditional spare ribs baked", imageUrl: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg", chef: "Chef John", cookingTime: "20 min", rating: 4.0, onChangeFavorite: () {},);
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: SignInScreen(
//           onTapSignIn: () {}, onTapSignUp: () {  },
//         ),
//       ),
//     ),
//   );
// }
