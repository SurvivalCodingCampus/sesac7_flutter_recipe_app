import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '01_stateless/core/routing/router.dart';
import '01_stateless/di/di_setup.dart';
import '01_stateless/domain/use_case/fetch_recipes_use_case.dart';
import '01_stateless/domain/use_case/search_recipes_use_case.dart';

void main() {
  diSetup();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => GetRecipesUseCase(recipeRepository: getIt())),
        Provider(
          create: (_) => SearchRecipesUseCase(filterRecipesUseCase: getIt()),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
