import 'package:flutter/material.dart';

import '01_stateless/core/routing/router.dart';
import '01_stateless/di/di_setup.dart';

void main() {
  diSetup();

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
