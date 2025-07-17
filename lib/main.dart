import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/person_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_view_model.dart';

void main() {
  final mainViewModel = MainViewModel(
    personRepository: PersonRepositoryImpl(),
  );
  mainViewModel.fetchPersonData();

  runApp(
    MyApp(
      mainViewModel: mainViewModel,
    ),
  );
}

class MyApp extends StatelessWidget {
  final MainViewModel mainViewModel;

  const MyApp({
    super.key,
    required this.mainViewModel,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListenableBuilder(
        listenable: mainViewModel,
        builder: (context, child) {
          return MainScreen(
            viewModel: mainViewModel,
          );
        },
      ),
    );
  }
}
