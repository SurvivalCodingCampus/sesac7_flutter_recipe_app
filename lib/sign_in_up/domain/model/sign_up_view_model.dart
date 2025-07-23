import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isTermsAccepted = false;


  bool get isFormValid =>
    nameController.text.isNotEmpty &&
    emailController.text.isNotEmpty &&
    passwordController.text.isNotEmpty &&
    confirmPasswordController.text.isNotEmpty &&
    isTermsAccepted;

  SignUpViewModel() {
    emailController.addListener((){
      notifyListeners();
    });
    passwordController.addListener((){
      notifyListeners();
    });
  }

  void toggleTerms(value) {
    isTermsAccepted = value ?? false;
    notifyListeners();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() {
    print('Sign In clicked: ${emailController.text}');
    // 실제 로그인 로직
  }
}
