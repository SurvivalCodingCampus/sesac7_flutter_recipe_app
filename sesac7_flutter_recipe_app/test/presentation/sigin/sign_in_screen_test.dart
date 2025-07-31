

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/sns_login_button.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_field.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_in_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('SignInScreen renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SignInScreen(
                onSignInButtonClick: () {},
                onSignUpButtonClick: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Hello,'), findsOneWidget);
      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.byType(InputField), findsNWidgets(2));
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.byType(BigButton), findsOneWidget);
      expect(find.text('Or Sign in With'), findsOneWidget);
      expect(find.byType(SnsLoginButton), findsNWidgets(2));
      expect(find.text('Don\'t have an account? Sign up'), findsOneWidget);
    });

    testWidgets('onSignInButtonClick is called when Sign In button is tapped', (tester) async {
      bool signInClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SignInScreen(
                onSignInButtonClick: () {
                  signInClicked = true;
                },
                onSignUpButtonClick: () {},
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BigButton));
      await tester.pump();

      expect(signInClicked, isTrue);
    });

    testWidgets('onSignUpButtonClick is called when Sign up text is tapped', (tester) async {
      bool signUpClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SignInScreen(
                onSignInButtonClick: () {},
                onSignUpButtonClick: () {
                  signUpClicked = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Sign up', findRichText: true));
      await tester.pump();

      expect(signUpClicked, isTrue);
    });
  });
}

