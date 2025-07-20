// import 'package:flutter/material.dart';
// import 'package:flutter_recipe_app/presentation/screen/filter_search_bottom_sheet.dart';
// import 'package:flutter_recipe_app/presentation/screen/saved_recipes_screen.dart';
// import 'package:flutter_recipe_app/presentation/screen/splash_screen.dart';
// import 'package:flutter_recipe_app/repository/recipe_repository_impl.dart';
// import 'package:flutter_recipe_app/presentation/view_model/recipe_view_model.dart';
// import 'package:flutter_recipe_app/presentation/view_model/search_recipe_view_model.dart';

import 'data_source/mock_recipe_data_source_impl.dart';

void main() {
  final searchRecipeViewModel = SearchRecipeViewModel(
    recipeRepository: RecipeRepositoryImpl(RecipeDataSourceImpl()),
  );

  searchRecipeViewModel.fetchRecipes();

  runApp(
    MyApp(
      searchRecipeViewModel: searchRecipeViewModel,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SearchRecipeViewModel searchRecipeViewModel;

  const MyApp({super.key, required this.searchRecipeViewModel});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: SearchRecipeScreen(searchRecipeViewModel: searchRecipeViewModel),
      home: MainScreen(),
    );
  }
}
