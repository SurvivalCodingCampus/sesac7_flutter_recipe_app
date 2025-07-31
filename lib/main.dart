import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/di/di.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

void main() {
  diSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      routerConfig: devRouter(),
    );
  }
}
