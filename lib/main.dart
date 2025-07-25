import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/di/di_setup.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import 'core/router.dart';

void main() {
  diSetup();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
      ),
      routerConfig: router,
    );
  }
}
