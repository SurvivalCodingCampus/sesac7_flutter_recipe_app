import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BigButton(buttonText: 'sign up', onTap: (){
            context.push('/sign-up');
          }),
          SizedBox(height: 10),
          BigButton(buttonText: 'sign in', onTap: (){
            context.go('/home');
          }),
        ],
      )
    );
  }
}
