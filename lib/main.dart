import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/person_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_view_model.dart';

import '01_stateless/core/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
