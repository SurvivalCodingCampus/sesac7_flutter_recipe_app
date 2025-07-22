import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      routerConfig: router,
    );
  }
}
