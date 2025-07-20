import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/03_mvvm/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen.dart';
import 'package:flutter_recipe_app/04_ui_state_holder/presentation/screen/search_recipes_screen_view_model.dart';

import '03_mvvm/data/data_source/recipe_data_source_impl.dart';

void main() {
  runApp(
    MyApp(
      viewModel: SearchRecipesScreenViewModel(
        recipeRepository: RecipeRepositoryImpl(
          dataSource: RecipeDataSourceImpl(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SearchRecipesScreenViewModel viewModel;

  const MyApp({
    super.key,
    required this.viewModel,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return SearchRecipesScreen(
              viewModel: viewModel,
            );
          },
        ),
      ),
    );
  }
}
