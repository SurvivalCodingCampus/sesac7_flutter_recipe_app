

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/sns_login_button.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_field.dart';
import 'package:flutter_recipe_app/presentation/sigin/sign_up_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpScreen', () {
    testWidgets('SignUpScreen renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SignUpScreen(
                onSignUpButtonClick: () {},
                onSignInButtonClick: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Create an account'), findsOneWidget);
      expect(find.text('Let\'s help you set up your account,\nit won\'t take long.'), findsOneWidget);
      expect(find.byType(InputField), findsNWidgets(4));
      expect(find.text('Accept Terms & Condition'), findsOneWidget);
      expect(find.byType(BigButton), findsOneWidget);
      expect(find.text('Or Sign in With'), findsOneWidget);
      expect(find.byType(SnsLoginButton), findsNWidgets(2));
      expect(find.text('Already a member? Sign In'), findsOneWidget);
    });

    testWidgets('onSignUpButtonClick is called when Sign Up button is tapped', (tester) async {
      bool signUpClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SignUpScreen(
                onSignUpButtonClick: () {
                  signUpClicked = true;
                },
                onSignInButtonClick: () {},
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BigButton));
      await tester.pump();

      expect(signUpClicked, isTrue);
    });

    testWidgets('onSignInButtonClick is called when Sign In text is tapped', (tester) async {
      bool signInClicked = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SignUpScreen(
                onSignUpButtonClick: () {},
                onSignInButtonClick: () {
                  signInClicked = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Sign In', findRichText: true));
      await tester.pump();

      expect(signInClicked, isTrue);
    });
  });
}

