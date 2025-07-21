import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/screen/search/search_view_model.dart';
import 'package:flutter_recipe_app/presentation/screen/search/search_view_screen.dart';

import 'data/data_source/recipe_data_source.dart';
import 'data/repository/recipe_repository.dart';

void main() {
  final RecipeDataSource recipeDataSource = RecipeDataSourceImpl();
  final RecipeRepository recipeRepository = RecipeRepositoryImpl(
    recipeDataSource,
  );
  final searchViewModel = SearchViewModel(recipeRepository: recipeRepository);

  runApp(
    MyApp(
      searchViewModel: searchViewModel,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SearchViewModel searchViewModel;

  const MyApp({
    super.key,
    required this.searchViewModel,
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
        listenable: searchViewModel,
        builder: (context, child) {
          return SearchViewScreen(
            viewModel: searchViewModel,
          );
        },
      ),
    );
  }
}
