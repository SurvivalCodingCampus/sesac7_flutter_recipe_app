import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/di/di.dart';

void main() {
  diSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: createRouter(),
    );
  }
}
