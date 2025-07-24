import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white, surface: AppColors.white),
      ),
      routerConfig: router,
    );
  }
}
