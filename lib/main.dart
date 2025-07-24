import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routing/router.dart';

void main() {
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     final data = await rootBundle.loadString('mock_json/recipe/recipes.json');
//     print('🔥 asset read success!');
//     print(data);
//   } catch (e) {
//     print('🚨 asset read fail: $e');
//   }
//
//   runApp(const MyApp());
// }

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
