import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInViewModel() {
    emailController.addListener((){
      notifyListeners();
    });
    passwordController.addListener((){
      notifyListeners();
    });
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void signIn() {
    print('Sign In clicked: ${emailController.text}');
    // 실제 로그인 로직
  }
}
