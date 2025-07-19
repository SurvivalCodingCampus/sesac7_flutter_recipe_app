import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/03_mvvm/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/03_mvvm/presentation/screen/saved_recipes_screen.dart';

import '03_mvvm/data/data_source/recipe_data_source_impl.dart';
import '03_mvvm/presentation/screen/saved_recipes_view_model.dart';

void main() {
  runApp(
    MyApp(
      viewModel: SavedRecipesViewModel(
        recipeRepository: RecipeRepositoryImpl(
          dataSource: RecipeDataSourceImpl(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

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
      home: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return SavedRecipesScreen(viewModel: viewModel);
        },
      ),
    );
  }
}
